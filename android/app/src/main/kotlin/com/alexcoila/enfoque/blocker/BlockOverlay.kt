package com.alexcoila.enfoque.blocker

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.RectF
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.style.ForegroundColorSpan
import android.util.TypedValue
import android.view.Gravity
import android.view.KeyEvent
import android.view.View
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import com.alexcoila.enfoque.R

/**
 * Pantalla de bloqueo dibujada encima de la app no permitida
 * (`TYPE_APPLICATION_OVERLAY`), con el diseño "Enfoque" (pantalla 7).
 * Mientras está visible, sus botones pueden abrir actividades (requisito de
 * Android 15 para lanzar desde segundo plano).
 */
class BlockOverlay(
    private val context: Context,
    private val onBackToApp: () -> Unit,
    private val onOpenAllowed: (String) -> Unit,
    private val onExitEarly: () -> Unit,
) {
    private val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private var root: View? = null
    private var blockedPackage: String? = null
    private var appIconView: ImageView? = null
    private var appNameView: TextView? = null
    private var ring: RingView? = null
    private var timeView: TextView? = null
    private var phaseView: TextView? = null

    private val regular by lazy { font("PlusJakartaSans-Regular") }
    private val semiBold by lazy { font("PlusJakartaSans-SemiBold") }
    private val bold by lazy { font("PlusJakartaSans-Bold") }

    val isShowing: Boolean get() = root != null

    fun show(packageName: String, label: String?, allowedApps: List<Pair<String, String>>) {
        if (root == null) {
            if (!AndroidPlatform.canDrawOverlays(context)) return
            val view = buildView(label, allowedApps)
            val params = WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                PixelFormat.OPAQUE,
            )
            val added = runCatching { windowManager.addView(view, params) }.isSuccess
            if (!added) return
            root = view
        }
        if (packageName != blockedPackage) {
            blockedPackage = packageName
            appIconView?.setImageDrawable(iconFor(packageName))
            appNameView?.text = context.getString(R.string.block_app_blocked, appLabel(packageName))
        }
    }

    fun hide() {
        val view = root ?: return
        runCatching { windowManager.removeView(view) }
        root = null
        blockedPackage = null
        appIconView = null
        appNameView = null
        ring = null
        timeView = null
        phaseView = null
    }

    /** [progress] = parte de la sesión ya transcurrida (0 a 1). */
    fun update(remainingMillis: Long, progress: Float, inBreak: Boolean) {
        val total = remainingMillis.coerceAtLeast(0) / 1000
        val h = total / 3600
        val m = (total % 3600) / 60
        val s = total % 60
        timeView?.text = if (h > 0) "%d:%02d:%02d".format(h, m, s) else "%02d:%02d".format(m, s)
        phaseView?.text = context.getString(
            if (inBreak) R.string.block_ring_break else R.string.block_ring_focus,
        )
        phaseView?.setTextColor(if (inBreak) AMBER else MINT)
        ring?.apply {
            this.progress = progress
            color = if (inBreak) AMBER else MINT
            invalidate()
        }
    }

    // --- Construcción de la vista ---

    private fun buildView(label: String?, allowedApps: List<Pair<String, String>>): View {
        val content = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            setPadding(dp(24), dp(40), dp(24), dp(32))
        }

        // Ícono de la app bloqueada con el candado.
        val iconFrame = FrameLayout(context)
        appIconView = ImageView(context).apply {
            background = circle(SURFACE_HIGH)
            setPadding(dp(18), dp(18), dp(18), dp(18))
        }
        iconFrame.addView(appIconView, FrameLayout.LayoutParams(dp(88), dp(88)))
        val lock = ImageView(context).apply {
            setImageResource(android.R.drawable.ic_lock_idle_lock)
            setColorFilter(MINT)
            background = circle(SURFACE_HIGHEST)
            setPadding(dp(6), dp(6), dp(6), dp(6))
        }
        iconFrame.addView(
            lock,
            FrameLayout.LayoutParams(dp(32), dp(32), Gravity.BOTTOM or Gravity.END),
        )
        content.addView(iconFrame, LinearLayout.LayoutParams(dp(96), dp(96)))

        appNameView = text("", 18f, ON_SURFACE, semiBold).apply { setPadding(0, dp(16), 0, 0) }
        content.addView(appNameView)

        val first = context.getString(R.string.block_motivation_1)
        val second = context.getString(R.string.block_motivation_2)
        val motivation = SpannableStringBuilder(first + second).apply {
            setSpan(ForegroundColorSpan(MINT), first.length, first.length + second.length, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        }
        content.addView(
            text("", 26f, ON_SURFACE, bold).apply {
                text = motivation
                setPadding(0, dp(8), 0, dp(24))
            },
        )

        // Anillo con el tiempo restante.
        val ringFrame = FrameLayout(context)
        ring = RingView(context, dp(12).toFloat())
        ringFrame.addView(ring, FrameLayout.LayoutParams(dp(220), dp(220)))
        val center = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
        }
        timeView = text("", 48f, ON_SURFACE, bold).apply { fontFeatureSettings = "tnum" }
        phaseView = text("", 12f, MINT, semiBold).apply { letterSpacing = 0.15f }
        center.addView(timeView)
        center.addView(phaseView)
        ringFrame.addView(center, FrameLayout.LayoutParams(dp(220), dp(220)))
        content.addView(ringFrame, LinearLayout.LayoutParams(dp(220), dp(220)))

        val remaining = if (label.isNullOrBlank()) {
            context.getString(R.string.block_remaining)
        } else {
            context.getString(R.string.block_remaining_of, label)
        }
        content.addView(text(remaining, 15f, ON_SURFACE_VARIANT, regular).apply { setPadding(0, dp(16), 0, dp(24)) })

        content.addView(
            pillButton("▶  " + context.getString(R.string.block_back)) { onBackToApp() },
            LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, dp(56)),
        )

        if (allowedApps.isNotEmpty()) {
            content.addView(
                text("✓  " + context.getString(R.string.block_allowed), 14f, ON_SURFACE_VARIANT, regular).apply {
                    setPadding(0, dp(24), 0, dp(12))
                },
            )
            val row = LinearLayout(context).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER
            }
            allowedApps.take(MAX_SHORTCUTS).forEach { (pkg, appName) ->
                row.addView(allowedTile(pkg, appName), LinearLayout.LayoutParams(dp(80), LinearLayout.LayoutParams.WRAP_CONTENT))
            }
            content.addView(row)
        }

        content.addView(
            text(context.getString(R.string.block_exit), 14f, OUTLINE, regular).apply {
                paintFlags = paintFlags or Paint.UNDERLINE_TEXT_FLAG
                setPadding(dp(16), dp(28), dp(16), dp(12))
                minHeight = dp(48)
                isClickable = true
                setOnClickListener { onExitEarly() }
            },
        )

        val scroll = object : ScrollView(context) {
            // Captura "atrás" para que no cierre la pantalla de bloqueo.
            override fun dispatchKeyEvent(event: KeyEvent): Boolean {
                if (event.keyCode == KeyEvent.KEYCODE_BACK) return true
                return super.dispatchKeyEvent(event)
            }
        }
        scroll.isFillViewport = true
        scroll.setBackgroundColor(BACKGROUND)
        scroll.isFocusable = true
        scroll.isFocusableInTouchMode = true
        scroll.addView(content)
        return scroll
    }

    private fun allowedTile(pkg: String, appName: String): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            isClickable = true
            setOnClickListener { onOpenAllowed(pkg) }
            val icon = ImageView(context).apply {
                setImageDrawable(iconFor(pkg))
                background = rounded(SURFACE_HIGH, dp(16).toFloat())
                setPadding(dp(12), dp(12), dp(12), dp(12))
            }
            addView(icon, LinearLayout.LayoutParams(dp(56), dp(56)))
            addView(
                text(appName, 12f, ON_SURFACE_VARIANT, regular).apply {
                    maxLines = 1
                    setPadding(dp(2), dp(6), dp(2), 0)
                },
            )
        }

    private fun pillButton(label: String, onClick: () -> Unit) =
        text(label, 17f, ON_MINT, bold).apply {
            gravity = Gravity.CENTER
            background = rounded(MINT, dp(28).toFloat())
            isClickable = true
            setOnClickListener { onClick() }
        }

    private fun text(value: String, sizeSp: Float, color: Int, face: Typeface) =
        TextView(context).apply {
            text = value
            textSize = sizeSp
            setTextColor(color)
            typeface = face
            gravity = Gravity.CENTER
        }

    private fun circle(color: Int) = GradientDrawable().apply {
        shape = GradientDrawable.OVAL
        setColor(color)
    }

    private fun rounded(color: Int, radius: Float) = GradientDrawable().apply {
        cornerRadius = radius
        setColor(color)
    }

    private fun iconFor(pkg: String): Drawable? =
        runCatching { context.packageManager.getApplicationIcon(pkg) }.getOrNull()

    private fun appLabel(pkg: String): String = runCatching {
        val info = context.packageManager.getApplicationInfo(pkg, 0)
        context.packageManager.getApplicationLabel(info).toString()
    }.getOrDefault(pkg.substringAfterLast('.'))

    /** Usa la fuente de la app (assets de Flutter); si falla, la del sistema. */
    private fun font(name: String): Typeface = runCatching {
        Typeface.createFromAsset(context.assets, "flutter_assets/assets/fonts/$name.ttf")
    }.getOrDefault(Typeface.DEFAULT)

    private fun dp(value: Int): Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP,
        value.toFloat(),
        context.resources.displayMetrics,
    ).toInt()

    /** Anillo de progreso. */
    private class RingView(context: Context, private val stroke: Float) : View(context) {
        var progress = 0f
        var color = MINT
        private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeCap = Paint.Cap.ROUND
            strokeWidth = stroke
        }
        private val rect = RectF()

        override fun onDraw(canvas: Canvas) {
            rect.set(stroke / 2, stroke / 2, width - stroke / 2, height - stroke / 2)
            paint.color = SURFACE_HIGH
            canvas.drawArc(rect, 0f, 360f, false, paint)
            paint.color = color
            canvas.drawArc(rect, -90f, 360f * (1f - progress.coerceIn(0f, 1f)), false, paint)
        }
    }

    private companion object {
        const val MAX_SHORTCUTS = 4

        // Tokens del diseño (DESIGN.md), iguales a lib/app/theme/tokens.dart.
        val BACKGROUND = Color.parseColor("#13131B")
        val SURFACE_HIGH = Color.parseColor("#292932")
        val SURFACE_HIGHEST = Color.parseColor("#34343D")
        val ON_SURFACE = Color.parseColor("#E4E1ED")
        val ON_SURFACE_VARIANT = Color.parseColor("#C7C4D6")
        val OUTLINE = Color.parseColor("#918F9F")
        val MINT = Color.parseColor("#3DDBB4")
        val ON_MINT = Color.parseColor("#0F0F17")
        val AMBER = Color.parseColor("#F5B544")
    }
}
