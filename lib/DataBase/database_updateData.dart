import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserData{
  final String uid;


  UpdateUserData({this.uid});

  final CollectionReference userRef= FirebaseFirestore.instance.collection('users');

  final CollectionReference dailyExpensesRef= FirebaseFirestore.instance.collection('daily_expenses');

  final CollectionReference dailyIncomeRef= FirebaseFirestore.instance.collection('daily_income');


  final CollectionReference monthlyExpensesRef= FirebaseFirestore.instance.collection('monthly_expenses');

  final CollectionReference monthlyIncomeRef= FirebaseFirestore.instance.collection('monthly_income');






  Future<void> addUser(String firstName,String lastName,String gender,String age, String email, String address,String phoneNumber,String image)
  async {
      return await userRef.doc(uid).set({
        'FirstName': firstName,
        'LastName': lastName,
        'Gender': gender,
        'Age': age,
        'Email':email,
        'Address': address,
        'Phone': phoneNumber,
        'Image': image

      });
  }

  Future addDailyExpense(String date, String conveyance, String shopping , String medical,String grocery, String maintenance, String others, String userUid, String id, String day, String month, String year)
  async {

    var xConveyance=int.parse(conveyance);
    assert(xConveyance is int);

    var xShopping=int.parse(shopping);
    assert(xShopping is int);

    var xMedical=int.parse(medical);
    assert(xMedical is int);

    var xGrocery=int.parse(grocery);
    assert(xGrocery is int);

    var xMaintenance=int.parse(maintenance);
    assert(xMaintenance is int);

    var xOthers=int.parse(others);
    assert(xOthers is int);

    var xDay=int.parse(day);
    assert(xDay is int);

    int total=xConveyance+xShopping+xMedical+xGrocery+xMaintenance+xOthers;
    return await dailyExpensesRef.doc(userUid).collection(year).doc(id).set({
      'Day':xDay,
      'Month':month,
      'Date':date,
      'Salary':xConveyance,
      'Business':xShopping,
      'House Rent':xMedical,
      'Car Rent':xGrocery,
      'Interest':xMaintenance,
      'Total':total,
      'Id':id,
    });
  }

  Future addMonthlyExpense(String month,String year,String userId, String id,int monthId,String houseRent,String utility,String services,String loan,String deposit,String education,String festivals,String travel,String others)
  async{

    var xHouseRent=int.parse(houseRent);
    assert(xHouseRent is int);

    var xUtility=int.parse(utility);
    assert(xUtility is int);

    var xServices=int.parse(services);
    assert(xServices is int);

    var xLoan=int.parse(loan);
    assert(xLoan is int);

    var xDeposit=int.parse(deposit);
    assert(xDeposit is int);

    var xEducation=int.parse(education);
    assert(xEducation is int);

    var xFestivals=int.parse(festivals);
    assert(xFestivals is int);

    var xTravel=int.parse(travel);
    assert(xTravel is int);

    var xOthers=int.parse(others);
    assert(xOthers is int);

    int total=xHouseRent+xUtility+xServices+xLoan+xDeposit+xEducation+xFestivals+xTravel+xOthers;

    return monthlyExpensesRef.doc(userId).collection(year).doc(id).set({
      'HouseRent':xHouseRent,
      'Utility' :xUtility,
      'Services':xServices,
      'Loan' :xLoan,
      'Deposit':xDeposit,
      'Education' :xEducation,
      'Festivals':xFestivals,
      'Travel' :xTravel,
      'Others':xOthers,
      'Month' :month,
      'Year':year,
      'Id':id,
      'MonthId' :monthId,
      'Total':total
    });


  }

  Future addDailyIncome(String amount, String day, String month, String year,String date, String userId, String id)
  async{
    var xAmount=int.parse(amount);
    assert(xAmount is int);

    var xDay=int.parse(day);
    assert(xDay is int);

    return await dailyIncomeRef.doc(userId).collection(year).doc(id).set({
      'Day':xDay,
      'Month':month,
      'Date':date,
      'Amount':xAmount,
      'Id':id,

    });
  }

  Future addMonthlyIncome(String salary, String business , String houseRent,String carRent, String interest, String userUid, String id, String month, String year,int monthId)
  async {

    var xSalary=int.parse(salary);
    assert(xSalary is int);

    var xBusiness=int.parse(business);
    assert(xBusiness is int);

    var xHouseRent=int.parse(houseRent);
    assert(xHouseRent is int);

    var xCarRent=int.parse(carRent);
    assert(xCarRent is int);

    var xInterest=int.parse(interest);
    assert(xInterest is int);


    int total=xSalary+xBusiness+xHouseRent+xCarRent+xInterest;
    return await monthlyIncomeRef.doc(userUid).collection(year).doc(id).set({
      'Month':month,
      'Year':year,
      'MonthId':monthId,
      'Salary':xSalary,
      'Business':xBusiness,
      'House Rent':xHouseRent,
      'Car Rent':xCarRent,
      'Interest':xInterest,
      'Total':total,
      'Id':id,
    });
  }

}