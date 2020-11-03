public class Caculator {
    public static float calculate(float firstNum, float secondNum, String operator){
        switch(operator){
            case "+":
                return firstNum + secondNum;
            case "-" :
                return firstNum - secondNum;
            case "*":
                return firstNum * secondNum;
            case "/":
               if(secondNum!=0){
                   return firstNum / secondNum;
               }else{
                   throw new RuntimeException("can not divided by 0");
               }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
