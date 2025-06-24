import tkinter as tk
from tkinter import messagebox
import psycopg2
import subprocess

exe = r"C:\Users\Eduardo\Desktop\gamefile\AnyMeans.exe"

def conectar():
    try:
        conn = psycopg2.connect(
            host='localhost',
            database='Heist',
            user='postgres',
            password='32654808aa'
        )
        print("Conexão ao banco de dados PostgreSQL bem-sucedida!\n")
        return conn
    except psycopg2.Error as error:
        print("Erro ao conectar ao PostgreSQL:", error)
        return None

def criar_conta():
    email = email_entry.get()
    username = username_entry.get()
    senha = senha_entry.get()

    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM users WHERE email = %s OR user_name = %s", (email, username))
        if cursor.fetchone():
            messagebox.showerror("Erro", "Este email ou nome de usuário já está sendo usado. Tente novamente.")
            return

        cursor.execute("INSERT INTO users (user_name, email, password) VALUES (%s, %s, %s)", (username, email, senha))
        conn.commit()
        messagebox.showinfo("Sucesso", "Conta criada com sucesso!")

    except psycopg2.Error as error:
        conn.rollback()
        messagebox.showerror("Erro", f"Erro ao criar conta: {error}")

    finally:
        cursor.close()

def login():
    username = username_entry.get()
    senha = senha_entry.get()

    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM users WHERE user_name = %s AND password = %s", (username, senha))
        if cursor.fetchone():
            messagebox.showinfo("Sucesso", "Login feito com sucesso!")
            subprocess.run([exe])
        else:
            messagebox.showerror("Erro", "Nome de usuário ou senha incorretos. Tente novamente.")

    except psycopg2.Error as error:
        messagebox.showerror("Erro", f"Erro ao realizar login: {error}")

    finally:
        cursor.close()

def excluir_conta():
    username = username_entry.get()

    cursor = conn.cursor()
    try:
        cursor.execute("DELETE FROM users WHERE user_name = %s", (username,))
        if cursor.rowcount > 0:
            messagebox.showinfo("Sucesso", f"Conta do usuário '{username}' foi excluída com sucesso.")
        else:
            messagebox.showinfo("Info", f"Usuário '{username}' não encontrado. Nenhuma conta foi excluída.")

        conn.commit()

    except psycopg2.Error as error:
        conn.rollback()
        messagebox.showerror("Erro", f"Erro ao excluir conta: {error}")

    finally:
        cursor.close()

def sair():
    resposta = messagebox.askyesno("Confirmação", "Tem certeza que quer sair?")
    if resposta:
        if conn is not None:
            conn.close()
            print("Conexão ao PostgreSQL foi fechada.")
        root.destroy()

def mostrar_tela_inicial():
    for widget in root.winfo_children():
        widget.destroy()

    header = tk.Label(root, text="Bindujoca Login", bg='blue', fg='white', font=('Helvetica', 16))
    header.pack(fill='x')

    container = tk.Frame(root)
    container.pack(pady=50)

    tk.Label(container, text="Escolha uma opção:", font=('Helvetica', 14)).pack(pady=10)

    tk.Button(container, text="Criar conta", command=mostrar_tela_criar_conta, width=20).pack(pady=5)
    tk.Button(container, text="Login", command=mostrar_tela_login, width=20).pack(pady=5)
    tk.Button(container, text="Excluir conta", command=mostrar_tela_excluir_conta, width=20).pack(pady=5)
    tk.Button(container, text="Sair", command=sair, width=20).pack(pady=5)

def mostrar_tela_criar_conta():
    for widget in root.winfo_children():
        widget.destroy()

    header = tk.Label(root, text="Bindujoca Login", bg='blue', fg='white', font=('Helvetica', 16))
    header.pack(fill='x')

    container = tk.Frame(root)
    container.pack(pady=50)

    tk.Label(container, text="Digite seu email:", font=('Helvetica', 12)).pack(pady=5)
    global email_entry
    email_entry = tk.Entry(container, width=30)
    email_entry.pack()

    tk.Label(container, text="Digite seu nome de usuário:", font=('Helvetica', 12)).pack(pady=5)
    global username_entry
    username_entry = tk.Entry(container, width=30)
    username_entry.pack()

    tk.Label(container, text="Digite sua senha:", font=('Helvetica', 12)).pack(pady=5)
    global senha_entry
    senha_entry = tk.Entry(container, show='*', width=30)
    senha_entry.pack()

    tk.Button(container, text="Criar conta", command=criar_conta, width=20).pack(pady=10)
    tk.Button(container, text="Voltar", command=mostrar_tela_inicial, width=20).pack(pady=5)

def mostrar_tela_login():
    for widget in root.winfo_children():
        widget.destroy()

    header = tk.Label(root, text="Bindujoca Login", bg='blue', fg='white', font=('Helvetica', 16))
    header.pack(fill='x')

    container = tk.Frame(root)
    container.pack(pady=50)

    tk.Label(container, text="Digite seu nome de usuário:", font=('Helvetica', 12)).pack(pady=5)
    global username_entry
    username_entry = tk.Entry(container, width=30)
    username_entry.pack()

    tk.Label(container, text="Digite sua senha:", font=('Helvetica', 12)).pack(pady=5)
    global senha_entry
    senha_entry = tk.Entry(container, show='*', width=30)
    senha_entry.pack()

    tk.Button(container, text="Login", command=login, width=20).pack(pady=10)
    tk.Button(container, text="Voltar", command=mostrar_tela_inicial, width=20).pack(pady=5)

def mostrar_tela_excluir_conta():
    for widget in root.winfo_children():
        widget.destroy()

    header = tk.Label(root, text="Bindujoca Login", bg='blue', fg='white', font=('Helvetica', 16))
    header.pack(fill='x')

    container = tk.Frame(root)
    container.pack(pady=50)

    tk.Label(container, text="Digite o nome de usuário da conta que deseja excluir:", font=('Helvetica', 12)).pack(pady=5)
    global username_entry
    username_entry = tk.Entry(container, width=30)
    username_entry.pack()

    tk.Button(container, text="Excluir conta", command=excluir_conta, width=20).pack(pady=10)
    tk.Button(container, text="Voltar", command=mostrar_tela_inicial, width=20).pack(pady=5)

if __name__ == "__main__":
    conn = conectar()
    if conn is None:
        print("Falha na conexão com o banco de dados.")
        exit()

    root = tk.Tk()
    root.title("Bindujoca Login")
    root.geometry("500x600")
    mostrar_tela_inicial()
    root.mainloop()
