import com.intuit.karate.junit5.Karate;

class BreakingbadRunner {
    
     @Karate.Test
     Karate testAll() {
         return Karate.run().relativeTo(getClass());
     }
}