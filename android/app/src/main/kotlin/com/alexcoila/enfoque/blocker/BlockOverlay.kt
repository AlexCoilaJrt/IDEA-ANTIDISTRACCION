package com.alexcoila.enfoque.blocker

import android.content.Context
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.Gravity
import android.view.KeyEvent
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import com.alexcoila.enfoque.R

/**
 * Pantalla de bloqueo dibujada encima de la app no permitida
 * (`TYPE_APPLICATION_OVERLAY`). Mientras está visible, sus botones pueden abrir
 * actividades (requisito de Android 15 para lanzar desde segundo plano).
 */
class BlockOverlay(
    private val context: Context,
    private val onBackToApp: () -> Unit,
    private val onOpenAllowed: (String) -> Unit,
    private val onExitEarly: () -> Unit,
) {
    private val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private var root: View? = null
    private var remainingView: TextView? = null
    private var phaseView: TextView? = null

    val isShowing: Boolean get() = root != null

    fun show(allowedApps: List<Pair<String, String>>) {
        if (root != null || !AndroidPlatform.canDrawOverlays(context)) return
        val view = buildView(allowedApps)
        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.OPAQUE,
        )
        runCatching { windowManager.addView(view, params) }
            .onSuccess { root = view }
    }

    fun hide() {
        val view = root ?: return
        runCatching { windowManager.removeView(view) }
        root = null
        remainingView = null
        phaseView = null
    }

    fun update(remainingMillis: Long, inBreak: Boolean) {
        val totalSeconds = (remainingMillis.coerceAtLeast(0) / 1000)
        val text = context.getString(
            R.string.block_remaining,
            totalSeconds / 3600,
            (totalSeconds % 3600) / 60,
            totalSeconds % 60,
        )
        remainingView?.text = text
        phaseView?.text = context.getString(
            if (inBreak) R.string.block_phase_break_strict else R.string.block_phase_focus,
        )
    }

    private fun dp(value: Int): Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP,
        value.toFloat(),
        context.resources.displayMetrics,
    ).toInt()

    private fun buildView(allowedApps: List<Pair<String, String>>): View {
        val layout = object : LinearLayout(context) {
            // Captura "atrás" para que no cierre la pantalla de bloqueo.
            override fun dispatchKeyEvent(event: KeyEvent): Boolean {
                if (event.keyCode == KeyEvent.KEYCODE_BACK) return true
                return super.dispatchKeyEvent(event)
            }
        }
        layout.orientation = LinearLayout.VERTICAL
        layout.gravity = Gravity.CENTER
        layout.setBackgroundColor(BACKGROUND)
        layout.setPadding(dp(24), dp(48), dp(24), dp(48))
        layout.isFocusable = true
        layout.isFocusableInTouchMode = true

        phaseView = text(context.getString(R.string.block_phase_focus), 14f, ACCENT)
        layout.addView(phaseView)
        layout.addView(text(context.getString(R.string.block_title), 24f, Color.WHITE, bold = true))
        layout.addView(text(context.getString(R.string.block_message), 16f, MUTED))

        remainingView = text("", 44f, Color.WHITE, bold = true).apply {
            setPadding(0, dp(24), 0, dp(24))
            fontFeatureSettings = "tnum"
        }
        layout.addView(remainingView)

        layout.addView(button(context.getString(R.string.block_back), filled = true) { onBackToApp() })

        if (allowedApps.isNotEmpty()) {
            layout.addView(text(context.getString(R.string.block_allowed), 14f, MUTED).apply {
                setPadding(0, dp(24), 0, dp(8))
            })
            allowedApps.take(MAX_SHORTCUTS).forEach { (pkg, label) ->
                layout.addView(button(label, filled = false) { onOpenAllowed(pkg) })
            }
        }

        layout.addView(View(context), LinearLayout.LayoutParams(0, dp(32)))
        layout.addView(button(context.getString(R.string.block_exit), filled = false, subtle = true) {
            onExitEarly()
        })
        return layout
    }

    private fun text(value: String, sizeSp: Float, color: Int, bold: Boolean = false) =
        TextView(context).apply {
            text = value
            textSize = sizeSp
            setTextColor(color)
            gravity = Gravity.CENTER
            if (bold) typeface = Typeface.DEFAULT_BOLD
            setPadding(0, dp(4), 0, dp(4))
        }

    private fun button(label: String, filled: Boolean, subtle: Boolean = false, onClick: () -> Unit) =
        Button(context).apply {
            text = label
            isAllCaps = false
            minHeight = dp(48)
            setTextColor(if (filled) Color.WHITE else if (subtle) MUTED else ACCENT)
            background = GradientDrawable().apply {
                cornerRadius = dp(28).toFloat()
                setColor(if (filled) PRIMARY else Color.TRANSPARENT)
                if (!filled && !subtle) setStroke(dp(1), ACCENT)
            }
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            ).apply { topMargin = dp(8) }
            setOnClickListener { onClick() }
        }

    private companion object {
        const val MAX_SHORTCUTS = 4
        // Mismos tokens que el tema de Flutter (seed 0xFF5B5BD6, modo oscuro).
        val BACKGROUND = Color.parseColor("#121218")
        val PRIMARY = Color.parseColor("#5B5BD6")
        val ACCENT = Color.parseColor("#C0C1FF")
        val MUTED = Color.parseColor("#A9A9B8")
    }
}
