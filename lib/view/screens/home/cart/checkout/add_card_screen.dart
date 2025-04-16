import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '**** **** **** 2345';
  String cardHolder = 'Noman Manzoor';
  String expiryDate = '02/30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addCard),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Card Design
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Finaci',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    cardNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.cardHolderName,
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            cardHolder,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              AppLocalizations.of(context)!.expiryDate,
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            expiryDate,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText:   AppLocalizations.of(context)!.name,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  cardHolder = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText:  AppLocalizations.of(context)!.cardNumber,
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.credit_card),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  cardNumber = value.isNotEmpty ? value : '**** **** **** 2345';
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText:   AppLocalizations.of(context)!.expiry,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      setState(() {
                        expiryDate = value.isNotEmpty ? value : '02/30';
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText:   AppLocalizations.of(context)!.cvc,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                  AppLocalizations.of(context)!.paymentSuccessMessage,
                style: TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: Icon(Icons.payment, color: Colors.white),
                label: Text(
                    AppLocalizations.of(context)!.payForOrder,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

