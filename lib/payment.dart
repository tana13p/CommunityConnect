import 'package:flutter/material.dart';

void main() {
  runApp(PaymentPage());
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
        ),
        body: PaymentForm(),
      ),
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _processPayment(String paymentOption) {
    // Here you can implement the logic to process the payment
    // For now, let's just print the payment details
    print('Payment Details:');
    print('Card Number: ${_cardNumberController.text}');
    print('Expiry Date: ${_expiryDateController.text}');
    print('CVV: ${_cvvController.text}');
    print('Payment Option: $paymentOption');
    // You can also navigate to a confirmation page after successful payment
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _cardNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Card Number'),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expiryDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(labelText: 'Expiry Date'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  controller: _cvvController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'CVV'),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Pay Now'),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentOptionButton(
                icon: Icons.phone,
                label: 'PhonePe',
                onPressed: () {
                  // Implement payment with PhonePe
                },
              ),
              PaymentOptionButton(
                icon: Icons.account_balance_wallet,
                label: 'Paytm',
                onPressed: () {
                  // Implement payment with Paytm
                },
              ),
              PaymentOptionButton(
                icon: Icons.payment,
                label: 'Google Pay',
                onPressed: () {
                  // Implement payment with Google Pay
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentOptionButton(
                icon: Icons.monetization_on,
                label: 'BHIM UPI',
                onPressed: () {
                  // Implement payment with BHIM UPI
                },
              ),
              PaymentOptionButton(
                icon: Icons.credit_card,
                label: 'Razorpay',
                onPressed: () {
                  // Implement payment with Razorpay
                },
              ),
              PaymentOptionButton(
                icon: Icons.account_balance,
                label: 'Netbanking',
                onPressed: () {
                  // Implement payment with Netbanking
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const PaymentOptionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}