import json
import os
from datetime import datetime

def validate_date(date_str):
    try:
        datetime.strptime(date_str, "%Y-%m-%d")
        return True
    except ValueError:
        return False

def load_transactions():
    if not os.path.exists("transactions.json"):
        return []
    try:
        with open("transactions.json", "r") as file:
            return json.load(file)
    except (json.JSONDecodeError, FileNotFoundError):
        return []

def save_transactions(transactions):
    try:
        with open("transactions.json", "w") as file:
            json.dump(transactions, file, indent=4)
    except Exception as e:
        print(f"Error saving transactions: {e}")

def add_transaction(transactions):
    try:
        t_type = input("Enter transaction type (1 for income, 0 for expense): ").strip()
        if t_type not in ["1", "0"]:
            raise ValueError("Invalid transaction type. Enter 1 for income or 0 for expense.")

        amount = input("Enter transaction amount: ").strip()
        if not amount.replace('.', '', 1).isdigit() or float(amount) <= 0:
            raise ValueError("Amount must be a positive number.")

        category = input("Enter category (G for Grocery, R for Rent, C for Car, S for Salary): ").strip().upper()
        if category not in ["G", "R", "C", "S"]:
            raise ValueError("Invalid category. Choose from G, R, C, S.")

        date = input("Enter date (YYYY-MM-DD): ").strip()
        if not validate_date(date):
            raise ValueError("Invalid date format. Please use YYYY-MM-DD.")

        transaction = {
            "type": "income" if t_type == "1" else "expense",
            "amount": float(amount),
            "category": category,
            "date": date
        }
        transactions.append(transaction)
        save_transactions(transactions)
        print("Transaction added successfully!")
    except ValueError as e:
        print(f"Error: {e}")

def view_transactions(transactions):
    if not transactions:
        print("No transactions found.")
        return

    print("\nTransactions:")
    print("=" * 40)
    for idx, transaction in enumerate(transactions, start=1):
        type_ = transaction.get('type', 'N/A')
        amount = transaction.get('amount', 'N/A')
        category = transaction.get('category', 'N/A')
        date = transaction.get('date', 'N/A')
        print(f"{idx}. Type: {type_}, Amount: €{amount:.2f}, Category: {category}, Date: {date}")
    print("=" * 40)

def generate_summary(transactions):
    if not transactions:
        print("No transactions found.")
        return

    total_income = sum(t.get("amount", 0) for t in transactions if t.get("type") == "income")
    total_expenses = sum(t.get("amount", 0) for t in transactions if t.get("type") == "expense")
    balance = total_income - total_expenses

    print("\nFinancial Summary:")
    print("=" * 40)
    print(f"Total Income: €{total_income:.2f}")
    print(f"Total Expenses: €{total_expenses:.2f}")
    print(f"Balance: €{balance:.2f}")
    print("=" * 40)

def main():
    transactions = load_transactions()

    while True:
        print("\nPersonal Finance Manager")
        print("=" * 40)
        print("1. Add transaction")
        print("2. View transactions")
        print("3. Generate financial summary")
        print("4. exit")
        choice = input("Enter your choice: ").strip()

        if choice == "1":
            add_transaction(transactions)
        elif choice == "2":
            view_transactions(transactions)
        elif choice == "3":
            generate_summary(transactions)
        elif choice == "4":
            print("Bye!")
            break
        else:
            print("Invalid choice. Try again")

if __name__ == "__main__":
    main()

# Example Input/Output:
# =========================
# Input:
# Enter transaction type (1 for income, 0 for expense): 1
# Enter transaction amount: 1500
# Enter category (G for Grocery, R for Rent, C for Car, S for Salary): S
# Enter date (YYYY-MM-DD): 2025-01-01
# Output:
# Transaction added successfully!
#
# Input:
# Enter your choice: 2
# Output:
# Transactions:
# ========================================
# 1. Type: income, Amount: €1500.00, Category: S, Date: 2025-01-01
# ========================================
#
# Input:
# Enter your choice: 3
# Output:
# Financial Summary:
# ========================================
# Total Income: €1500.00
# Total Expenses: €0.00
# Balance: €1500.00
# ========================================
#
# Input:
# Enter your choice: 4
# Output:
# Goodbye!
