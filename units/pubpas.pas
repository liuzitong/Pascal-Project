unit pubpas;

interface

uses Types;

type
  TReport = packed record
    ReportID: Byte;
    Bytes: array [0..63] of Byte;
  end;

type
  TServer2Lower=record        //Ͷ�䲼�㶼Ҫ��
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    dotcon:byte;  //3    0xc1��0x00�� �̼�������
    da:array[1..2] of Byte;  //4,5   ����DBֵ��Ӧ��ADֵ,���ֽ���ǰ
    xcoord:byte;  //6   X����1-24    
    rcoord:byte;  //7  R����1-20
    gcoord:byte;  //8  G����1-20
    stimtime:array[1..2] of Byte;  //word;  //9,10 10-11λ��Ҫ��̼�������ʱ�䣬��λΪ����  ���ֽ���ǰ����Χ0-2000���� ���Ϊ0xff  0xff ��������������
    gillcon:byte; //11  0xc2��0x00��  ���е������
    gillup:byte;  //12  �϶�0xff
    gilldown:byte;  //13  �¶�0xff
    gillleft:byte;  //14  ��0xff
    gillright:byte;  //15  �Ҷ�0xff
    cameracon:byte;  //16   0xc3��0x00�� ����ͷ��Դ����
    cameraonoff:byte; // 17  ��Դ��0xff  ��Դ��0x00
    otherlamp:byte;  //18  0xc4��0x00�� ���������� ��ִ�з�0x00
    fixlamp:array[1..9] of Byte;  //19-27   ���ӵ�1-9   ��ֵ1-255
    Infraredlamp:array[1..4] of Byte; //28-31   �����1-4   ��ֵ1-255
    backlamp:array[1..3] of Byte; //32-34   ������R   ������G  ������B   ��ֵ1-255
    lowerstatus:byte;  //35   0xc5��0x00��Ҫ����λ������״̬
    lowerbuzy:byte; //36   �践��0xff  ���践��0x00  æ״̬
    lowerserial:byte;  //37  �践��0xff  ���践��0x00   Ӳ�������
    answer:byte;  //  38  ��Ӧ��״̬  �践��0xff  ���践��0x00
    glasspos:byte;  // 39   ����״̬  �践��0xff  ���践��0x00
    envlight1:byte;  // 40  ������1   �践��0xff  ���践��0x00
    envlight2:byte;  // 41  ������2   �践��0xff  ���践��0x00
    envtemper:byte;  //42  �����¶�   �践��0xff  ���践��0x00
    eyeleft:byte;     //43  ����λ       �践��0xff  ���践��0x00
    eyeright:byte;  //44  ����λ      �践��0xff  ���践��0x00
    motorlimit:byte; //45  �����λ״̬   �践��0xff  ���践��0x00
    savedata:byte;  // 46 �洢����        �践��0xff  ���践��0x00
    backup:array[1..15] of Byte;  // 47��61�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;
{
0XAA  0X0F  0XEE  0XC7    0X??  0X??  0X??   0X??   0X??   0X??
     ֡ͷ       ������� ��    ���1����λ����         ����
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
���2����λ����       ����    ���3����λ����       ��   ��
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
���4����λ����       ����    ���5����λ����       ��   ��
0X??  0X??   0X??  0X??  0X??   0X??   0X00   0X00  0X00    0X00
���6����λ����       �� ��ɫ  ��� --------------------------

0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
--------------------------------����--------------------------
0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
 -------------------------------------------------------------
0X00   0X00  0X4E  0X4F
}
type            //Ͷ���
  TServer2LowerTs=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc7 �������
    motor1:array[1..5] of Byte;
//���˳��Ϊ���۽��������ɫ�����DB���������ߵ����DB�������X�����y��������ŵ��
//��һλ������λ�����壺0X00Ϊ�����ƣ�0X11Ϊ˳ʱ��ת��0X22Ϊ��ʱ��ת��0X33Ϊ��λ������Զ��ظ�����翪��λ�ü�0�����λ�ã�
//�ڶ���������λ��ת�ĽǶ�λ�����ʾ����ֵ��λ��ǰ������ÿ��1.8�ȵĲ������ת360��Ҫ200�����壬������Ϊ128ϸ����ת360��Ҫ25600�����壬
//ÿ���������0.0140625�ȣ����Ҫ���ת30�Ⱦ�������ֵΪ2133�����壨ʮ�����Ʊ�ʾ0x00 0x08 0x55��;���Ҫ���ת1440�Ⱦ�������ֵΪ102400�����壨ʮ�����Ʊ�ʾ0x01 0x90 0x00����
    motor2:array[1..5] of Byte;
    motor3:array[1..5] of Byte;
    motor4:array[1..5] of Byte;
    motor5:array[1..5] of Byte;
    motor6:array[1..5] of Byte; //-33
    color:byte;  //34  Э��35λΪ ��ɫ ����ֵ��Χʮ����1��5
    size:byte;   //35  Э��36λΪ ��� ����ֵ��Χʮ����1��6
    stimmode:byte; //36 Э��37λΪ ���ŷ�ʽ��88��ʾ���ú�����λ����ʱ��
    stimtime:array[1..2] of byte; //37,38 Э��38-39λΪ ����ʱ��
    backup:array[1..23] of Byte;  //39-61  40��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ����
  TServer2LowerTsMove=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motorx:array[1..3] of Byte;
    motory:array[1..3] of Byte;
    motorspd:array[1..2] of Byte;
    motorjjstep:Byte; //12  ����ֶ���
    motorjj:array[1..10,1..3] of Byte;  //13-42
    backup:array[1..19] of Byte;  //43-61  44��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ���ߣ��ֶ�����ͷ
  TServer2LowerTsMove10H=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motords:byte;  //4  ����
    motorspd:array[1..2] of Byte; //5,6//�ٶ�
    motorxa:Byte;  //7 x����
    motorya:Byte;  //8����
    backup:array[1..53] of Byte;  //9-61  10��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ����,�ֶ���������
  TServer2LowerTsMove10N=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motordata:array[1..57] of Byte;  //3-59  4��60�ֽ�  Ϊ����
    addcs:byte;  //�ۼӴ���
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type
  TLower2Server=record
    head:array[1..3] of Byte;  //0,1,2  0xaa 0xf0 0xee 1��3��usbͨ��ʶ��֡ͷ
    lowerbuzy:byte; //3  æ0xff ��æ0x11
    lowerserialhard:array[1..2] of Byte;  //4��5  5��6 ��Ӳ����
    lowerserialsoft:array[1..2] of Byte;  //6��7  7��8�������
    answer:byte;  //  8 ����ȥ0xff  û��0x11
    answertime:array[1..2] of Byte; //9-10 �����̼� ��ķ�Ӧʱ�� ��λ����
    glasspos:byte;  // 11  ����״̬ ̧������0xff  ����ȥ��0x11
    eyeleft:byte;  //12  ����λ ��0xff ��0x11
    eyeright:byte;  //13  ����λ  ��0xff ��0x11
    envlight1:array[1..2] of Byte;  //14��15  15��16�ǻ�����1��ֵ
    envlight2:array[1..2] of Byte;  //16��17   17��18�ǻ�����2��ֵ
    envtemper:array[1..2] of Byte;  //18,19  �����¶�
    motorlimit:array[1..10] of byte; //20-29  �����λ��λ1-10  ��0xff ��0x11
    moveanswerx:array[1..2] of byte;  //30-31 X����
    moveanswery:array[1..2] of byte;  //32-33 Y����
    moveanswerds:byte;  //34 ����
    moveanswerjj:array[1..3] of byte;  //35-37 ���෽�򼰲���
    backup:array[1..24] of Byte;  //38-61 31��62�ֽ�Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63  0xe4  0xf4  63��64�ǽ���֡��

  end;

////////�޸�,��������������ӻ�����
type
  TSAVEDATABD=record   //78735Byte ��ȡDevData
    DEVTYPE:word; //0-1  0 ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  ������
    VERSION: word;  //8-9 �汾��
    DOT_DA:array[1..2, 1..24, 1..20, 0..40] of word;//0-78719 ��ɫ �� �� (0db, 40db)
    FOUCUS_DA:array[0..8] of word;
    BACK_DA:array[0..1,0..2] of word;
    HW_DA:array[0..3] of word;
    HJG_DA:word;
    DoubleRate:word;
    EYEMOVE: word;
    EYEGRAY: word;
    EvTemp: word;
    DB90:array[0..45] of word; //90��˥����������0��Ϊ������DB��*50�洢�����2�ȣ�0-45
    DBTemp:array[0..45] of word; //�¶�˥����������0��Ϊ������DB��*50�洢�����1�ȣ�0-45
    SBID: Cardinal;  //4-7  �豸���
    DJ_CS:array[1..2,1..17] of word; // �����������
    EYEGRAYH: word; //�Ʊ�������ֵ
    HJG_DAH: word;  //�Ʊ����⻷���ⱨ��ֵ    
  end;

////////�½�,��������������ӻ�����Ͷ��,������λ����Ҫ,��Щ������λ���Լ��õ�û�з�������
type
  TSAVEDATATS=record        //3306byte  ��ȡ DevData
    DEVTYPE:word; //0-1   ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  ������
    VERSION: word;  //8-9 �汾��
    FOUCUS_DA:array[0..8] of word;  //10-27 a~1b 9�����ӵ�ǿ�ȴ�С  ���ӵ����
    BACK_DA:array[0..1,0..2] of word; //28-39 [backmode �׹�,�ƹ�?] [0:r,1:g,2:b] �����Ƶ���
    HW_DA:array[0..3] of word; //40-47 28~2f  0 �Ʊ�����,1Ͷ���?,  2С����,2�����
    HJG_DA:word;  //48,49  30~31 �����ⱨ��ֵ �����ⱨ����ֵ DA
    TSG_DA:word;  //50,51  32~33 Ͷ���ǿ������ֵԤ��  ����û��  Ͷ���DA
    KM2C:word; //52,53 ���ſ�λ  
    YS_STEP:array[0..5] of word;  //54-65 0,��ȫͨ�� 1-5������ɫ�еĸ�����ɫ�����Ӧ�ĵ��ת������  ��ɫ
    GB_STEP:array[0..7] of word;  //66-81 0,��ȫͨ�� 1-7���ֹ���еĸ������������õĵ��ת������  ��߳ߴ�
    JJ2LD:word;  //82,83  52~53 ������������λ������Ҫ�ƶ��Ĳ���   ��������
    //���µ� smallint ��Ϊ integer ���ȼ�һ��
    X2C:integer;   //84-87 54~57 X����ڼ�������ĵ�ʱ���߶��Ĳ���,�Ը�λ�����  �����ĵ�
    Y2C:integer;   //88,91 58~5b  Y����ڼ�������ĵ�ʱ���߶��Ĳ���
    X2JZ:integer;  //92,95 5c~5f ��ǿУ��ʱ X��������߶��Ĳ���,�Ը�λ�����  �������û��  ��ǿУ��
    Y2JZ:integer;  //96,99 60~63 ��ǿУ��ʱ Y��������߶��Ĳ���
    JZJJ:word;  //�������integerλ������ȫ��������Լ��� 100,103  64~67 ��ǿУ��ʱ �����������߶��Ĳ���   ��ǿУ��_����
    X2LX:integer;   //104-107 68~6b �����������ĵ����ʱX��������߶��Ĳ���   ��������
    Y2LX:integer;  //108-111  6c~6f �����������ĵ����ʱY��������߶��Ĳ���
    LXJJ:word;  // 112-113  0x70~0x71�������ĵ����ʱ �����������߶��Ĳ��� �������ĵ�_����
    JJ_FW:array[0..1] of word; //114-117 72~73 С 74~75 ��  �������ĵ���������Χ,�Ӹ�λλ�ÿ�ʼ����  ������Χ
    JJ_STEP:array[1..7,1..25] of word;  //118-467 0x76~0x1d3  ����������ߣ����룩��Ӧ�������Ӹ�λλ�ÿ�ʼ����  ����������ұ�
    DB_STEP:array[0..1,0..51] of word; //468-675 0x1d4~0x2a3  dB��Ӧ����ɫ����͹�ߵ������ת���Ĳ���  DB������
    EYEGRAY: word;     //676-677 0x2a4~ 0x2a5   ͫ�׻Ҷ�ֵ ʶ��ͫ����   ͫ�׻Ҷ���ֵ?
    EvTemp: word;     //678-679   0x2a6~0x2a7  ����û��  �����¶�
    X2CF:integer;   //680-683 0x2a8~0x2ab    �����ĵ�������X�������  �������Ĳ�
    Y2CF:integer;   //684-687 0x2ac~0x2af    �����ĵ�������Y�������
    SBID: Cardinal;  //688-691 0x2b0~ 0x2b3   �豸���
    DJ_CS:array[1..8,1..17] of word; //692-963 0x2b3~0x3c3   �����������   ���������  �°治��Ҫ
    EYEGRAYH: word; //964-965 0x3c4~0x3c5  �Ʊ�������ֵ
    HJG_DAH: word;  //964-965 0x3c6~0x3c7 �Ʊ����⻷���ⱨ��ֵ
    DB90:array[0..45] of word; //966-1057  90��˥����������0��Ϊ������DB��*50�洢�����2�ȣ�0-45   0-90��˥��
    DBTemp:array[0..45] of word; //1058-1149 �¶�˥����������0��Ϊ������DB��*50�洢�����1�ȣ�0-45    �¶�����
  end;

////////�½�
type
  TSAVEDATAHead=record        //����ͷ ����Ͷ�����ݵ�ǰ��һ��
    DEVTYPE:word; //0-1  0 ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  �豸���
    VERSION: word;  //8-9 �汾��
  end;

////////�½�
type
  TDEVTESTDATA=record         //Fmain.FormCreate�ж�ȡDevTestSet.dat�õ�,��ʵDevData.datҲ�д洢,���Ǻ����,������˸��ļ�
    TIMESPACE: BYTE;
    CtbcTs: WORD;
    XtbcTs: WORD;
    Cz0Ts: WORD;
    Cz40Ts: WORD;
    //Ͷ��ӣ��洢�ڱ��ص�  ��Ҫ�ĳɴ洢����λ��
    XY2STEP: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y ��Ӧ��X�������Y����������볤��      ���λ�ñ�
    XY2STEP2: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y ��Ӧ��X�������Y����������볤��    ���λ�ø���
    JJ_STEPT:array[1..2,1..25] of smallint;  //����ʱx,yλ��   ������������   �о�û��
    DoubleRate:byte;
    VERSION: word;  //�汾��
    SAVEPATH: ShortString;  //�洢·��
  end;                                    									 //10080


type
  TPrefer=record
    Maintag:integer;
    Analysis:string[10];
    AnalysisHint:string;
    kbeangle:integer;
    kenangle:integer;
    testnum:integer;
    testStrategy:string[16];
    flashcolor:string[10];
    flashdiam:string[2];
    flashtime:integer;
    breaktime:integer;
    backcolor:string[10];
    backbright:integer;
    testdot:string;
    TestResult:string;
    LorR: string[5];
    BAnswer: integer;    //ä��Ӧ��
    BTest: integer;        //ä�������
    Dqbd: single;  //���ڲ���  sc=���ȱ��
    Pjqs: single; //ƽ��ȱ��  SC=����ȱ��
    TestPjz: single;  //ƽ��������
    TestDateTime: TDateTime;
    TestTime: string[6];
    JyjcNum:integer; //�����Լ���
    JyydNum:integer; //������Ӧ���
    JsjcNum:integer; //�����Լ���
    JsydNum:integer; //������Ӧ���
    TestDb:integer;  //screen test use db
    ReportMs:byte; //���浥ģʽ
    xxdb1: single;  //����db
    xxdb2: single;  //����db
    xxdb3: single;  //����db
    xxdb4: single;  //����db
end;

type
  tdata=record
    x:integer;              //�����x,y����ֵ,��democheckdata.pt��ֵ
    y:integer;
    db:integer;              //�����ǵ�һ�����Ƶ���ֵ,��ʼֵ����Ϊ0,��democheckdata��ֵ,��4��������һ����ֵ
    arr:boolean;             //��ʼֵΪtrueӦ�ñ�ʾָû���Եĵ� falseӦ�����Ѿ������˵ĵ�
    oren:byte;                //��ʼֵΪ0 ��DelYDQK�б���ֵ
    isxy4:boolean;             //��ʼֵΪfalse,��ʼ��getXy4����4����Ϊtrue,֮����hasEnded������������Ĵ��ֶ�Ϊtrue
    arrtime:integer;           //����?    ��ʼֵΪ4
    DBlow,DBmid,DBhigh:byte;   //Ԥ��DB�ķ�Χ DBmid ��ʼֵΪ0
end;

type
  TPatient = record
     Id:string;
     name:string[10];   //����
     sex:string[2];     //�Ա�
     age:string[3];     //����
     birthdate:string[10];
     eyesight:string;     //����
     eyepower:string;  //��ѹ
     eyediam:string;  //ֱ��
end;

type T5MotorArr=array[0..5] of integer;
type T10JJMotorArr=array[0..10] of integer;
type T10MotorArr=array[0..4,0..10] of integer;  //jj,x,y����ֶβ���,x,y�ֶ�λ������X10

type
  newtdatarray = array of tdata;
  TDataArray = array of array of Single;
  PInteger = ^Integer;
  TIntArray = array of integer;
  TMDArray = array[0..56,0..1] of byte;
  TYCArray = array[0..23,0..1] of single;

var
  Server2Lower:TServer2Lower;
  Server2LowerTs:TServer2LowerTs;
  Server2LowerTsMove:TServer2LowerTsMove;
  Server2LowerTsMove10H:TServer2LowerTsMove10H;
  Server2LowerTsMove10N:TServer2LowerTsMove10N;


  Lower2Server:TLower2Server;
  SaveDataBd:TSAVEDATABD;         //���� ��TFMain.TimerInitTimer->ButtonInitClick-> ReadDevData ��ʼ����
  SaveDataTs:TSAVEDATATS;       //Ͷ��
  SaveDataHead:TSAVEDATAHead;   //Ӳ��   ��TFMain.TimerInitTimer->ButtonInitClick->ButtonReadHeadClick ��ʼ����
  SaveDataHeadLocal:TSAVEDATAHead; //����
  OldPoint: TPoint;
  OldDB,OldGB,OldColor: byte;
  Old5MotorStep: T5MotorArr;  //�洢��һ��Ͷ��ʱ5������λ��
  OldPId: integer;
  changeparm: boolean;

  Old4XY: boolean;                  //btStartClick֮���趨Ϊtrue,��hasEnded��xy4endΪtrueʱ�趨Ϊfalse,false֮��Ż�ԷǶ�λ��֮������������             
  priXYFW,priXYFWF: boolean;
  T100msCount:integer;

  pubmovearr: T10MotorArr;
  pubanswerxy,pubanswerxystep:TPoint;

  pubMotoBuzy: boolean; //���״̬ æ����
  pubblindon: boolean;  //ä��
  pubtestover: boolean;
  pubKmOpen: boolean; //������
  pubCurZbx: byte;  //1,2����ϵͳ

  pubmoveline: boolean; //ɨ��
  pubmoveend: boolean;  //��ɨ�����
  pubmoveanswer: boolean; //ɨ��Ӧ��
  pubmovebackx,pubmovebacky,pubmovebackjj,pubmovexfx,pubmoveyfx: integer;
  pubmovexstep,pubmoveystep,pubmovejjstep: integer;

  DevTestData:TDEVTESTDATA;
  ExeFilePath:string;

  USBReadbuf:array[0..10240] of byte;

  USBDataBuf:array[0..102400] of byte;

  USBDataBufXj:array[0..102400] of byte;

  ////////
  A: TDataArray;
  pubqdcx: string;
  pubgbqd: boolean;
  pubYhdw,pubKorFstr: string;
  pubKorF: integer;
  pubPatient: TPatient;
  pubPrefer: TPrefer;
  pubMaintag: integer;
  pubblindx,pubblindy,pubblinddb: Byte;

  pubkey: boolean;
  pubkey1: boolean;
  publevel: Byte;       // =0 �²��� ��1 VIEW  ��2 ѡ���ز�
  pubQdms: Byte;      //=0 �Զ�ȡ�� ��1 �ӿ�ȡ�� ��2 ����ȡ��
  pubDub: boolean;  //�Ƿ��Ѳ�˫��
  pubSave: boolean;
  pubResW: byte;  //1������һ�ۣ�2������
  pubLoad,pubLoadDb: boolean;
  pubZrfs: byte;  //1-��������, 2-FMAN ����
  pubZdpz,pubResultDb: string;
  pubDbTime: TDateTime;

  pubProjId: integer;
  pubxx1,pubxx2,pubxx3,pubxx4: boolean;  //����ѡ��
  pubhastest: integer;                    //�Ѿ������˵ĵ�
  pubbackon: boolean;

  My_top_db:integer;
  beep:boolean;  //07.9.16�޸ģ���ҳ����ʱĬ������Ϊfalse����Ĭ�ϲ�����

  publight,pubAnswer,pubAnswStop,pubHjg:boolean;  //true ǿ�� FALSE ����
  pubmovspid: byte; //1--9    �ƶ��ٶ�
  pubshowgray: boolean;  //�Ҷ���ʾ
  pubEyeMoveYN: boolean;

  oldglass: byte;


  pmoverstrstep,pmovelstrstep: string;

  pmaxdb: integer;
  //////
  pubentertest: boolean;
  pubentertestmode: byte;   //�����鷽ʽ 0 main  1 new 2 doc
  pubcurid: string;

  prikey,pritesting,pubgets:boolean; //pubgets��ȡӲ��״̬,showread��false.  pritesting hasEnded�ڲ����Ĵﵽ��Ŀ֮����Ϊfalse.

  pubhjgda: integer;

  pubMoveTestSend: boolean; //

implementation


end.
