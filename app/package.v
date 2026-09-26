#!/usr/bin/env python3
import tkinter as tk

class Calculator:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("V-Core Calculator")
        self.root.geometry("300x420")
        self.root.configure(bg="#1a1a2e")
        self.root.resizable(False, False)
        self.expr = ""

        self.display = tk.Label(
            self.root, text="0", anchor="e",
            bg="#16213e", fg="#e94560",
            font=("monospace", 26), padx=12, pady=18
        )
        self.display.pack(fill="x", padx=8, pady=8)

        buttons = [
            ["C", "(", ")", "/"],
            ["7", "8", "9", "*"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["0", ".", "=", ""],
        ]

        frame = tk.Frame(self.root, bg="#1a1a2e")
        frame.pack(expand=True, fill="both", padx=8, pady=4)

        for r, row in enumerate(buttons):
            for c, b in enumerate(row):
                if not b:
                    continue
                color = "#e94560" if b == "=" else "#0f3460"
                btn = tk.Button(
                    frame, text=b, font=("sans", 14, "bold"),
                    bg=color, fg="white",
                    activebackground="#e94560", activeforeground="white",
                    bd=0, relief="flat",
                    command=lambda x=b: self.click(x)
                )
                btn.grid(row=r, column=c, sticky="nsew", padx=3, pady=3, ipady=8)

        for i in range(4):
            frame.columnconfigure(i, weight=1)
        for i in range(5):
            frame.rowconfigure(i, weight=1)

        self.root.mainloop()

    def click(self, b):
        if b == "C":
            self.expr = ""
            self.display.config(text="0")
        elif b == "=":
            try:
                result = str(eval(self.expr))
                self.display.config(text=result)
                self.expr = result
            except Exception:
                self.display.config(text="Error")
                self.expr = ""
        else:
            self.expr += b
            self.display.config(text=self.expr)

if __name__ == "__main__":
  Calculator()
