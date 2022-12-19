import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


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

  List<String> months = [
    'Jan' ,
    'Feb' ,
    'Mar' ,
    'Apr' ,
    'May' ,
    'Jun' ,
    'Jul' ,
    'Aug' ,
    'Sep' ,
    'Oct' ,
    'Nov' ,
    'Dec'
  ];

  DateTime? selectedDate;

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

            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context, builder: (context){
                      return Container(
                        height: height!/2 +80,
                        width: width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12) ,
                            topLeft: Radius.circular(12)
                          )
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Choose a month' ,
                                style: TextStyle(
                                  fontSize: 17 ,
                                  fontWeight: FontWeight.w600
                                ),),

                                IconButton(
                                    onPressed: ()=> Navigator.pop(context),
                                    icon: const Icon(Icons.cancel))
                              ],
                            ) ,

                            const SizedBox(height: 20,) ,
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                itemCount: months.length,
                                  itemBuilder: (context , index){
                                   return InkWell(
                                     onTap: (){
                                       setState(() {
                                         expiryMonth = months[index];
                                       });
                                       Navigator.pop(context);
                                     },
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(months[index] ,
                                         style: const TextStyle(
                                           fontSize: 16 ,
                                           fontWeight: FontWeight.w600
                                         ),) ,

                                         const SizedBox(height: 10,) ,

                                         Container(
                                           height: 1,
                                           width: width,
                                           color: Colors.grey,
                                         ) ,

                                         const SizedBox(height: 10,)
                                       ],
                                     ),
                                   );
                                }),
                            ),
                          ],
                        ),
                      );
                });
              },
              child: Container(
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
                  style: const TextStyle(
                    fontSize: 16 ,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ) ,

            const SizedBox(height: 20,) ,
            
            label('Credit card expiry year') ,

            InkWell(
              onTap: () async {
                final picker = await  showDatePicker(
                  context: context,
                  initialDatePickerMode: DatePickerMode.year,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
                if(picker != null){
                  expiryYear = DateFormat('yyyy').format(picker);
                  print('The Expiry Year $expiryYear');
                }

                // ignore: use_build_context_synchronously
                Navigator.pop(context);

              },
              child: Container(
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
                    style: const TextStyle(
                        fontSize: 16 ,
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),
            ) ,

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
