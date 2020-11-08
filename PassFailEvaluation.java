package grade;

public class PassFailEvaluation implements GradeEvaluation{

	@Override
	public String getGrade(int point) {
		// TODO Auto-generated method stub
	
		if(point >= 70 && point <=100)
			return "p";
		else			
			return "F";
	}
}
