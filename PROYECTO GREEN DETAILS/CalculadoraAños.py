import tkinter as tk
from tkinter import simpledialog, messagebox
from datetime import datetime

def calcular_edad(fecha_nacimiento):
    # Convertir la fecha de nacimiento a un objeto datetime
    fecha_nac = datetime.strptime(fecha_nacimiento, "%Y-%m-%d")
    # Obtener la fecha actual
    hoy = datetime.now()
    
    # Calcular la diferencia en años
    edad = hoy.year - fecha_nac.year
    
    # Ajustar la edad si aún no ha llegado el cumpleaños este año
    if (hoy.month, hoy.day) < (fecha_nac.month, fecha_nac.day):
        edad -= 1
    
    return edad

def mostrar_edad():
    # Pedir la fecha de nacimiento al usuario
    fecha_nacimiento = simpledialog.askstring("Fecha de nacimiento", "Ingrese la fecha de nacimiento (YYYY-MM-DD):")
    
    if fecha_nacimiento:
        try:
            edad = calcular_edad(fecha_nacimiento)
            messagebox.showinfo("Resultado", f"La edad es: {edad} años")
        except ValueError:
            messagebox.showerror("Error", "Formato de fecha inválido. Use YYYY-MM-DD.")
    else:
        messagebox.showwarning("Advertencia", "No se ingresó ninguna fecha.")

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Calculadora de Edad")
ventana.geometry("300x100")

# Crear y colocar el botón
boton = tk.Button(ventana, text="Calcular Edad", command=mostrar_edad)
boton.pack(expand=True)

# Iniciar el bucle de eventos
ventana.mainloop()
