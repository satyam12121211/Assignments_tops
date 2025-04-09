class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance = balance + amount;
      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance = balance - amount;
      print("Withdrawn: $amount");
    } else {
      print("Insufficient balance or invalid amount.");
    }
  }

  void checkBalance() {
    print("Current Balance: $balance");
  }
}

void main() {
  BankAccount account = BankAccount("123456789", "harsh", 1000.0);
  account.deposit(500);
  account.withdraw(200);
  account.checkBalance();
}
