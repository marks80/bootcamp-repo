class BankAccount:
    def __init__(self):
        self.balance = 200

    def get_balance(self):
        print(f"Current balance: {self.balance}")
        return self.balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Deposited {amount}. New balance: {self.balance}")
        return self.balance

    def withdraw(self, amount):
        if amount > 0:
            self.balance -= amount
            print(f"Withdrew {amount}. New balance: {self.balance}")
        return self.balance

def main_menu():
    account = BankAccount()

    while True:
        print("\n--- Bank Account System ---")
        print("1. Check Balance")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Exit")

        try:
            choice = int(input("Enter your choice (1-4): "))
        except ValueError:
            print("Invalid input. Please enter a number between 1 and 4.")
            continue

        if choice == 1:
            account.get_balance()

        elif choice == 2:
            amount = float(input("Enter amount to deposit: "))
            account.deposit(amount)

        elif choice == 3:
            amount = float(input("Enter amount to withdraw: "))
            account.withdraw(amount)

        elif choice == 4:
            print("Exit")
            break

if __name__ == "__main__":
    main_menu()
