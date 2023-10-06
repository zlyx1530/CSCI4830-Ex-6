import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

public aspect TraceAspectReal {
    pointcut getNameMethod():
        execution(String getName());

    before() : getNameMethod() {
        Signature signature = thisJoinPointStaticPart.getSignature();
        String methodName = signature.getName();
        String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();
        int lineNumber = thisJoinPointStaticPart.getSourceLocation().getLine();

        System.out.println("Before execution");
        System.out.println("Method's File Name: " + fileName);
        System.out.println("Method Signature: " + methodName);
        System.out.println("Method Line Number: " + lineNumber);
    }

    after() : getNameMethod() {
        Signature signature = thisJoinPointStaticPart.getSignature();
        String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();

        System.out.println("After execution");
    }
}

