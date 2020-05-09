pragma solidity ^0.5.6;
import "./SafeMath.sol";
contract SurveyContract{
    using SafeMath for uint256;
    /////////////////////////////////////structure///////////////////////////
    uint public TotalSurvey;

    mapping (uint => Surveysheet) public surveyindex;
    
    struct Surveysheet{
        bool surveyStart;
        address Surveyer;
        string purpose;
        string SNS;
        uint TotalQuestionsheet;
        uint TotalAnswersheet;
        mapping(uint =>Questionsheet) QuestionsheetIndex;
        mapping(uint =>Answersheet) AnswersheetIndex;
    }
    
    struct Answersheet{
        address Answerer;
        uint TotalInfo;
        uint TotalAnswer;
        mapping(uint => Infos) InfoIndex;
        mapping(uint => Answers) AnswerIndex;
    }
    
    struct Infos{
        string info;
    }
    
    struct Answers{
        string answer;
    }
    
    struct Questionsheet{
        uint TotalQuestion;
        mapping(uint => Question) QuestionIndex;
    }
    
    struct Question{
        string question;
    }
    
    ///////////////////////////////function///////////////////////////////////////////
    
    function makeSurvey(string memory _purpose, string memory _SNS) public{
        Surveysheet storage _Surveysheet = surveyindex[TotalSurvey];
        _Surveysheet.surveyStart == true;
        _Surveysheet.purpose = _purpose;
        _Surveysheet.SNS = _SNS;
        TotalSurvey.add(1);
    }
    
    function addQuestion(string memory _question) public{
        uint _TotalQuestionsheet = surveyindex[TotalSurvey].TotalQuestionsheet;
        Questionsheet storage _Questionsheet = surveyindex[TotalSurvey].QuestionsheetIndex[_TotalQuestionsheet];
        uint _TotalQuestion = _Questionsheet.TotalQuestion;
        _Questionsheet.QuestionIndex[_TotalQuestion].question = _question;
        _TotalQuestion.add(1);
    }
    
    function addAnswer(string memory _answer) public{
        uint _TotalAnswersheet = surveyindex[TotalSurvey].TotalAnswersheet;
        Answersheet storage _Answersheet = surveyindex[TotalSurvey].AnswersheetIndex[_TotalAnswersheet];
        uint _TotalAnswer = _Answersheet.TotalAnswer;
        _Answersheet.AnswerIndex[_TotalAnswer].answer = _answer;
        _TotalAnswer.add(1);
    }
    
     function addInfo(string memory _info) public{
        uint _TotalAnswersheet = surveyindex[TotalSurvey].TotalAnswersheet;
        Answersheet storage _Answersheet = surveyindex[TotalSurvey].AnswersheetIndex[_TotalAnswersheet];
        uint _TotalInfo = _Answersheet.TotalInfo;
        _Answersheet.InfoIndex[_TotalInfo].info = _info;
        _TotalInfo.add(1);
    }
    
    ///////////////////////view///////////////////////////////////////////////
    
   

}