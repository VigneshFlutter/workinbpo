import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuyPackageScreen extends StatefulWidget {
   String packageName ;
   String price ;
   String noOfDays;
   String noOfPosts ;
   BuyPackageScreen({Key? key ,
   required this.packageName ,
   required this.price ,
   required this.noOfDays ,
   required this.noOfPosts
   }) : super(key: key);

  @override
  State<BuyPackageScreen> createState() => _BuyPackageScreenState();
}

class _BuyPackageScreenState extends State<BuyPackageScreen> {

  double? height ;
  double? width ;

  String expiryMonth = 'Select a month';
  String expiryYear = 'Select a year';

  //TextEditing Controller
  TextEditingController nameTextEd = TextEditingController();
  TextEditingController cardNumTextEd = TextEditingController();
  TextEditingController cvvNumTextEd = TextEditingController();

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20,) ,

            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ) ,

            const SizedBox(height: 20,) ,

             Text('Buy a ${widget.packageName} package' ,
            style: const TextStyle(
              fontSize: 21 ,
              fontWeight: FontWeight.w600
            ),) ,

            const SizedBox(height: 15,) ,

            Container(
              height: 135,
              width: width,
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Package Price : ${widget.price}' ,
                  style: const TextStyle(
                    fontSize: 17 ,
                    fontWeight: FontWeight.w500
                  ),) ,
                  const SizedBox(height: 15,) ,
                  Text('Can post jobs: ${widget.noOfPosts}' ,
                    style: const TextStyle(
                        fontSize: 17 ,
                        fontWeight: FontWeight.w500
                    ),) ,
                  const SizedBox(height: 15,) ,
                  Text('Package duration: ${widget.noOfDays}',
                    style: const TextStyle(
                        fontSize: 17 ,
                        fontWeight: FontWeight.w500
                    ),) ,
                  const SizedBox(height: 15,)
                ],
              ),
            ) , 
            
            const SizedBox(height: 15,) , 
            
            label('Name on credit card') ,
            const SizedBox(height: 15,) ,
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CardNumberFormatter(),
              ],
              maxLength: 19,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                hintText: 'Enter your credit card name'
              ),
            ) ,

            const SizedBox(height: 20,) ,

            label('Credit card number') ,
            const SizedBox(height: 15,) ,

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your card name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),

            const SizedBox(height: 20,) ,

            label('Credit card expiry date') ,
            const SizedBox(height: 15,) ,

            Container(
              height: 45,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white ,
                border: Border.all(
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Text(expiryMonth ,
                style: TextStyle(

                ),),
              ),
            ) ,

            const SizedBox(height: 20,) ,
            
            label('Credit card expiry year') ,

            label('Cvv number') ,

            const SizedBox(height: 15,) ,

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your card name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),

            const SizedBox(height: 20,) ,
            
          ],
        ),
      ),
    );
  }
  
  Widget label(String data) {
    return Text(data , 
    style: const TextStyle(
      fontSize: 15 , 
      fontWeight: FontWeight.w500
    ),);
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue previousValue,
      TextEditingValue nextValue,
      ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString =  StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection:  TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
