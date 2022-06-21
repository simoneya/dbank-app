import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"; //converts to floating number.

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));


   stable var startTime = Time.now();
   startTime := Time.now();
   Debug.print(debug_show(startTime)); //To print time in nanoseconds since  1970-01-01.

  let id = 4756487628448654756;
   //Debug.print(debug_show(id));


  //Top Up function
  public func topUp(amount: Float) {     //provide data type for amount input which is a natural number. Natural number(Nat) any number which is positive.
   currentValue += amount;
   Debug.print(debug_show(currentValue));
  };



  //Withdrawl function
  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue - amount >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
  };


  public query func checkBalance(): async Float {
    return currentValue; //read only operation. We are not modifying anything.That's why we use query method.
  };



  public func compound () {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); //float makes both sides with same datatype.
    startTime := currentTime;
  };

}
