package school.report;

import java.util.ArrayList;

import grade.BasicEvaluation;
import grade.GradeEvaluation;
import grade.MajorEvaluation;
import grade.PassFailEvaluation;
import school.School;
import school.Score;
import school.Student;
import school.Subject;
import utils.Define;

public class GenerateGradeReport {
	School school = School.getInstance();
	public static final String TITLE = " ������ ���� \t\t\n";
	public static final String HEADER = " �̸� | �й� |�ʼ�����| ���� \n";
	public static final String LINE = "---------------------------\n";
	
	private StringBuffer buffer = new StringBuffer();
	
	
	public String getReport() {		
		ArrayList<Subject> subjectList = school.getSubjectList();
		
		for(Subject subject : subjectList) {
			makeheader(subject);
			makebody(subject);
			makefooter();
		}
		return buffer.toString();
	}
	private void makeheader(Subject subject) {
		// TODO Auto-generated method stub
		buffer.append(GenerateGradeReport.LINE);
		buffer.append("\t" + subject.getSubjectName());
		buffer.append(GenerateGradeReport.TITLE);
		buffer.append(GenerateGradeReport.HEADER);
		buffer.append(GenerateGradeReport.LINE);
	}
	
	private void makebody(Subject subject) {
		// TODO Auto-generated method stub
		ArrayList<Student> studentList = subject.getStudentList();
		
		for(int i = 0; i<studentList.size(); i++) {
			Student student = studentList.get(i);
			buffer.append(student.getStudentName());
			buffer.append(" | ");
			buffer.append(student.getStudentId());
			buffer.append(" | ");
			buffer.append(student.getMajorSubject().getSubjectName() + "\t");
			buffer.append(" | ");
			
			getScoreGrade(student, subject);
			buffer.append("\n");
			buffer.append(LINE);
		}
		
	}

	private void getScoreGrade(Student student, Subject subject) {
		// TODO Auto-generated method stub
		ArrayList<Score> scoreList = student.getScoreList();
		
		int majorId = student.getMajorSubject().getSubjectId();
		
		GradeEvaluation[] gradeEvaluation = {
				new BasicEvaluation(), new MajorEvaluation() , new PassFailEvaluation()
		};
		
		for(int i = 0; i<scoreList.size(); i++) {
			Score score = scoreList.get(i);
			if(score.getSubject().getSubjectId() == subject.getSubjectId()) {
				String grade;
				if(subject.getGradeType() == Define.PF_Type) {
					grade = gradeEvaluation[Define.PF_Type].getGrade(score.getPoint());
				}
				else {
					if(score.getSubject().getSubjectId() == majorId) {
						grade = gradeEvaluation[Define.SAB_Type].getGrade(score.getPoint());
					}else {
						grade = gradeEvaluation[Define.AB_Type].getGrade(score.getPoint());
						
					}					
				}
				buffer.append(score.getPoint());
				buffer.append(":");
				buffer.append(grade);
				buffer.append("|");
			}
		}
	}
	private void makefooter() {
		// TODO Auto-generated method stub
		buffer.append("\n");
	}

	

	
}
