# Personal Finance Manager

A Python-based command-line application to help you manage your personal finances. The script allows users to record transactions, view transaction history, and generate a financial summary.

## Features

- **Add Transactions**: Record income or expense transactions with relevant details such as amount, category, and date.
- **View Transactions**: Display all recorded transactions in a formatted list.
- **Generate Financial Summary**: Summarize total income, total expenses, and current balance.
- **JSON-based Storage**: All transactions are saved locally in a `transactions.json` file for persistence.

## Usage

   - Follow the menu options**:
   - Option `1`: Add a transaction
   - Option `2`: View all transactions
   - Option `3`: Generate a financial summary
   - Option `4`: Exit the application

### Example Walkthrough

#### Add a Transaction:

```plaintext
Enter transaction type (1 for income, 0 for expense): 1
Enter transaction amount: 1500
Enter category (G for Grocery, R for Rent, C for Car, S for Salary): S
Enter date (YYYY-MM-DD): 2025-01-01
Transaction added successfully!
```

#### View Transactions:

```plaintext
Transactions:
========================================
1. Type: income, Amount: €1500.00, Category: S, Date: 2025-01-01
========================================
```

#### Generate Financial Summary:

```plaintext
Financial Summary:
========================================
Total Income: €1500.00
Total Expenses: €0.00
Balance: €1500.00
========================================
```

---

## File Structure

- `transactions.json`: A JSON file used to store transaction data. This file is automatically created in the script's directory if it doesn't already exist.

---

## Error Handling

- Invalid inputs for transaction type, amount, category, or date will result in clear error messages.
- Malformed or missing `transactions.json` will not crash the program—a new file will be created if needed.

---

## Customization

You can customize the categories for transactions by modifying the `add_transaction` function in the script. Replace the existing categories (`G`, `R`, `C`, `S`) with your desired categories.

---

## License

This project is licensed under the MIT License. Feel free to use and modify it as you wish.

---

## Acknowledgements

- Developed using Python’s built-in modules (`json`, `os`, `datetime`).
- Inspired by the need for simple and efficient personal finance management.

---

## Contact

For issues or feature requests, please open an issue on this repository.

