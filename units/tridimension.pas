unit tridimension;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GLScene, GLObjects, GLMisc, GLWin32Viewer, ExtCtrls, GLCanvas, GLTexture,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, GLMultiPolygon,
  GLGeomObjects, GLExtrusion, GLGraph, cxControls, cxContainer, cxEdit,
  cxCheckBox, VectorGeometry, OpenGL1x, GeometryBB, GLCrossPlatform, xwxh,
  cxLabel;

const
  MAXW=100;

type
  TFtridimension = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    Panel1: TPanel;
    Panel2: TPanel;
    EtColor0: TPanel;
    EtColor2: TPanel;
    EtColor3: TPanel;
    EtColor4: TPanel;
    EtColor5: TPanel;
    EtColor6: TPanel;
    EtColor7: TPanel;
    EtColor8: TPanel;
    EtColor9: TPanel;
    EtColor10: TPanel;
    EtColor11: TPanel;
    EtColor12: TPanel;
    EtColor13: TPanel;
    EtColor14: TPanel;
    EtColor15: TPanel;
    EtColor16: TPanel;
    EtColor17: TPanel;
    EtColor18: TPanel;
    EtColor19: TPanel;
    EtColor1: TPanel;
    EtColor20: TPanel;
    GLLightSource1: TGLLightSource;
    Panel3: TPanel;
    BtRestore: TcxButton;
    BtZoomout: TcxButton;
    BtZoomin: TcxButton;
    EtFlat: TcxCheckBox;
    GLXYZGrid1: TGLXYZGrid;
    GLXYZGrid2: TGLXYZGrid;
    BtDemo: TcxButton;
    EtElapse: TcxLabel;
    GLDirectOpenGL1: TGLDirectOpenGL;
    BtDemo2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EtFlatClick(Sender: TObject);
    procedure BtRestoreClick(Sender: TObject);
    procedure BtZoomoutClick(Sender: TObject);
    procedure BtZoominClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtDemoClick(Sender: TObject);
    procedure GLDirectOpenGL1Render(Sender: TObject;
      var rci: TRenderContextInfo);
    procedure FormDestroy(Sender: TObject);
    procedure BtDemo2Click(Sender: TObject);
  private
    { Private declarations }
    mx,my:integer;
    DBColors:array[1..100] of TColor;
    GLList:TGLuint;
    procedure GetDbColors;
  public
    { Public declarations }
    Checkdata:TCheckdata;
    Checkresult:TCheckresult;
  end;

var
  Ftridimension: TFtridimension;

implementation

uses Myutils;

{$R *.dfm}

procedure TFtridimension.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  GLList:=GL_INVALID_VALUE;
  GetDbColors;
end;

procedure TFtridimension.FormDestroy(Sender: TObject);
begin
  if GLList<>GL_INVALID_VALUE then glDeleteLists(GLList, 2);
end;

procedure TFtridimension.GetDbColors;
begin
  DBColors[1]:=EtColor0.Color;
  DBColors[2]:=EtColor1.Color;
  DBColors[3]:=EtColor2.Color;
  DBColors[4]:=EtColor3.Color;
  DBColors[5]:=EtColor4.Color;
  DBColors[6]:=EtColor5.Color;
  DBColors[7]:=EtColor6.Color;
  DBColors[8]:=EtColor7.Color;
  DBColors[9]:=EtColor8.Color;
  DBColors[10]:=EtColor9.Color;
  DBColors[11]:=EtColor10.Color;
  DBColors[12]:=EtColor11.Color;
  DBColors[13]:=EtColor12.Color;
  DBColors[14]:=EtColor13.Color;
  DBColors[15]:=EtColor14.Color;
  DBColors[16]:=EtColor15.Color;
  DBColors[17]:=EtColor16.Color;
  DBColors[18]:=EtColor17.Color;
  DBColors[19]:=EtColor18.Color;
  DBColors[20]:=EtColor19.Color;
  DBColors[21]:=EtColor20.Color;

  DBColors[22]:=EtColor20.Color;
  DBColors[23]:=EtColor20.Color;
  DBColors[24]:=EtColor20.Color;
  DBColors[25]:=EtColor20.Color;
  DBColors[26]:=EtColor20.Color;
  DBColors[27]:=EtColor20.Color;
  DBColors[28]:=EtColor20.Color;
end;

procedure TFtridimension.EtFlatClick(Sender: TObject);
begin
  if GLList<>GL_INVALID_VALUE then glDeleteLists(GLList, 2);
  GLList:=GL_INVALID_VALUE;
  BtRestoreClick(Sender);
end;

procedure TFtridimension.BtRestoreClick(Sender: TObject);
begin
  GLCamera1.Position.X:=0;
  GLCamera1.Position.Y:=0;
  GLCamera1.Position.Z:=4;
end;

procedure TFtridimension.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   mx:=x; my:=y;
end;

procedure TFtridimension.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if Shift<>[] then GLCamera1.MoveAroundTarget(my-y, mx-x);
   mx:=x; my:=y;
   EtElapse.Caption:=Format('List:%d, Direction(%f,%f,%f, Position(%f,%f,%f), Up(%f,%f,%f)',[
                            GLList,
                            GLCamera1.Direction.X, GLCamera1.Direction.Y, GLCamera1.Direction.Z,
                            GLCamera1.Position.X, GLCamera1.Position.Y, GLCamera1.Position.Z,
                            GLCamera1.Up.X, GLCamera1.Up.Y, GLCamera1.Up.Z
                           ]);
end;

procedure TFtridimension.BtZoomoutClick(Sender: TObject);
begin
  if GLCamera1.Position.Z<6 then GLCamera1.Position.Z:=GLCamera1.Position.Z+1;
end;

procedure TFtridimension.BtZoominClick(Sender: TObject);
begin
  if GLCamera1.Position.Z>2 then GLCamera1.Position.Z:=GLCamera1.Position.Z-1;
end;

procedure TFtridimension.FormShow(Sender: TObject);
begin
  BtRestoreClick(Self);
end;

procedure TFtridimension.BtDemoClick(Sender: TObject);
var
  i,j:integer;
  x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3:double;
  r,w,h,d,dp:double;
  color:TColor;
  cv:TColorVector;
begin
  GLList:=glGenLists(2);
  glNewList(GLList, GL_COMPILE);

  r:=4;
  dp:=2;
  w:=r/CheckResult.GrayXCount;
  h:=r/CheckResult.GrayYCount;
  d:=0;
  for i:=1 to CheckResult.GrayYCount-1 do begin
    for j:=1 to CheckResult.GrayXCount-1 do begin
      if CheckResult.Gray2[i+0,j+0]=-1 then continue;
      if CheckResult.Gray2[i+1,j+0]=-1 then continue;
      if CheckResult.Gray2[i+1,j+1]=-1 then continue;
      if CheckResult.Gray2[i+0,j+1]=-1 then continue;

      color:=DBColors[1+((CheckResult.Gray2[i,j]+1) div 2)];

      x0:=(j-1)*w-r/2;
      y0:=r/2-(i-1)*h;
      z0:=w/40+dp*CheckResult.Gray2[i+0,j+0]/40;

      x1:=(j-0)*w-r/2;
      y1:=r/2-(i-1)*h;
      z1:=w/40+dp*CheckResult.Gray2[i+0,j+1]/40;

      x2:=(j-0)*w-r/2;
      y2:=r/2-(i-0)*h;
      z2:=w/40+dp*CheckResult.Gray2[i+1,j+1]/40;

      x3:=(j-1)*w-r/2;
      y3:=r/2-(i-0)*h;
      z3:=w/40+dp*CheckResult.Gray2[i+1,j+0]/40;

      if EtFlat.Checked then begin
        z0:=w/40;
        z1:=z0;
        z2:=z0;
        z3:=z0;
      end;

      cv:=ConvertWinColor(color);
      glColor4f(cv[0],cv[1],cv[2],cv[3]);

      glFrontFace(GL_CW);
      glBegin(GL_POLYGON);
        glVertex3f(x0+d, y0+d, z0);
        glVertex3f(x1-d, y1-d, z1);
        glVertex3f(x2-d, y2-d, z2);
        glVertex3f(x3+d, y3-d, z3);
      glEnd;

      glFrontFace(GL_CCW);
      glBegin(GL_POLYGON);
        glVertex3f(x0+d, y0+d, z0);
        glVertex3f(x1-d, y1-d, z1);
        glVertex3f(x2-d, y2-d, z2);
        glVertex3f(x3+d, y3-d, z3);
      glEnd;
    end;
  end;
  glEndList();
end;

procedure TFtridimension.BtDemo2Click(Sender: TObject);
var
  i,j:integer;
  x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,zs:double;
  r,w,h,d,dp:double;
  color:TColor;
  cv:TColorVector;
begin
  GLList:=glGenLists(2);
  glNewList(GLList, GL_COMPILE);

  r:=4;
  dp:=2;
  w:=r/CheckResult.GrayXCount;
  h:=r/CheckResult.GrayYCount;
  d:=0;
  for i:=1 to CheckResult.GrayYCount-1 do begin
    glBegin(GL_QUAD_STRIP);
    for j:=1 to CheckResult.GrayXCount-1 do begin
      if CheckResult.Gray2[i+0,j+0]=-1 then continue;
      if CheckResult.Gray2[i+1,j+0]=-1 then continue;
      if CheckResult.Gray2[i+1,j+1]=-1 then continue;
      if CheckResult.Gray2[i+0,j+1]=-1 then continue;

      color:=DBColors[1+((CheckResult.Gray2[i,j]+1) div 2)];

      zs:=w/2;
      x0:=(j-1)*w-r/2;
      y0:=r/2-(i-1)*h;
      z0:=zs+dp*CheckResult.Gray2[i+0,j+0]/40;

      x1:=(j-0)*w-r/2;
      y1:=r/2-(i-1)*h;
      z1:=zs+dp*CheckResult.Gray2[i+0,j+1]/40;

      x2:=(j-0)*w-r/2;
      y2:=r/2-(i-0)*h;
      z2:=zs+dp*CheckResult.Gray2[i+1,j+1]/40;

      x3:=(j-1)*w-r/2;
      y3:=r/2-(i-0)*h;
      z3:=zs+dp*CheckResult.Gray2[i+1,j+0]/40;

      if EtFlat.Checked then begin
        z0:=zs;
        z1:=z0;
        z2:=z0;
        z3:=z0;
      end;

      cv:=ConvertWinColor(color);
      glColor4f(cv[0],cv[1],cv[2],cv[3]);

      glVertex3f(x0+d, y0+d, z0);
      glVertex3f(x1-d, y1-d, z1);
      glVertex3f(x3+d, y3-d, z3);
      glVertex3f(x2-d, y2-d, z2);
    end;
    glEnd;
  end;
  glEndList();
end;

procedure TFtridimension.GLDirectOpenGL1Render(Sender: TObject;
  var rci: TRenderContextInfo);
var
  t:int64;
begin
  t:=StartPrecisionTimer;
  glPushAttrib(GL_ENABLE_BIT or GL_CURRENT_BIT or GL_LINE_BIT or GL_COLOR_BUFFER_BIT);
  glDisable(GL_LIGHTING);
  if GLList=GL_INVALID_VALUE then
    BtDemo2Click(Sender);
  glCallList(GLList);
  glPopAttrib;
  EtElapse.Caption:=Format('GLCanvas: %.2f msec', [StopPrecisionTimer(t)*1000]);
end;

end.
