#Requires AutoHotkey v2.0

; Remap Win + Tab to Win + Ctrl + (Right/Left)
#Tab:: {
  static toggle := true
  ; MsgBox Format("{1} {2}", toggle, counter)

  if toggle {
    Send("#^{Right}")
  } else {
    Send("#^{Left}")
  }

  toggle := !toggle
}
