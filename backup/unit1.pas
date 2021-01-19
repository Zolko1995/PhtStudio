unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtDlgs,
  StdCtrls, ExtCtrls, LCLIntf, ComCtrls, Math, Types, Unit2, Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    ProgressBar1: TProgressBar;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    ScrollBar5: TScrollBar;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Shape2ChangeBounds(Sender: TObject);
    procedure Shape3ChangeBounds(Sender: TObject);

  private

  public

  type
    Histogram = array[1..256] of Integer;


    const
    RPodil = 0.2989;
    GPodil = 0.5866;
    BPodil = 1-RPodil-GPodil;


  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject); //open picture
begin
  Image1.Visible:= True;
  OpenPictureDialog1.Execute;
  Image1.Picture.LoadFromFile(OpenPictureDialog1.Filename);
end;

procedure TForm1.Button20Click(Sender: TObject);
Var
x, y : integer;
r1, g1, b1, r2, g2, b2 : Byte;
t: Real;
c: TColor;
r: byte;
g: byte;
b: byte;
begin
  Form3.Image1.Height := Image2.Height;
  Form3.Image1.Width := Image2.Width;
  ProgressBar1.Max := Image1.width; ProgressBar1.Position := 0;
  for x := 0 to image1.Width - 1 do
    begin
    //t := 1/2;
    //t := x / Image1.Width;
    t := 1-(x/Image1.Width);
    ProgressBar1.Position := ProgressBar1.Position + 1;
    for y := 0 to Image1.Height - 1 do
    Begin
    c := Image1.Canvas.Pixels[x,y];
    r1 := (c and $0000FF);
    g1 := (c and $00FF00 shr 8);
    b1 := (c and $FF0000 shr 16);

    c := Image2.Canvas.Pixels[x,y];
    r2 := (c and $0000FF);
    g2 := (c and $00FF00 shr 8);
    b2 := (c and $FF0000 shr 16);

    r := Round((t*r1) + ((1 - t)*r2));
    g := Round((t*g1) + ((1 - t)*g2));
    b := Round((t*b1) + ((1 - t)*b2));
    Form3.Image1.Canvas.Pixels[x,y] := r + g shl 8 + b shl 16;
    end;
  end;
  Form3.Show;
end;

procedure TForm1.Button21Click(Sender: TObject);
Var
i,j:integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      Image2.Canvas.Pixels[i + 95,j + 95] := Image1.Canvas.Pixels[i,j];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button22Click(Sender: TObject);
Var
i,j,i2,j2,zoomy,zoomx : Integer;
begin
zoomx := Scrollbar5.Position;
zoomy := Scrollbar5.Position;
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      i2 := zoomx + i div Scrollbar5.Position;  // i2 := 100 + i div 3;
      j2 := zoomy + j div Scrollbar5.Position;  // j2 := 100 + j div 3;
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[i2,j2];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button23Click(Sender: TObject);
var
i,j: integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[Round(i*cos(0.19) - j*sin(0.19)),Round(i*sin(0.19) + j*cos(0.19))];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button24Click(Sender: TObject);
Var
i,j:integer;
  begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[Round( -65 + i + (0.4*j)),j];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button25Click(Sender: TObject);
Var
i,j:integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[Round((i*cos(0.19)-50) - (j*sin(0.19)-50)),Round((i*sin(0.19)-50) + (j*cos(0.19)-50))];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button26Click(Sender: TObject);
Var
i,j:integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to Image1.Picture.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to Image1.Picture.height do
    begin
      Image2.Canvas.Pixels[i, j] := Image1.Canvas.Pixels[image1.width - i, j];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button27Click(Sender: TObject);
Var
i,j:integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      Image2.Canvas.Pixels[i, j] := Image1.Canvas.Pixels[i, image1.height - j];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button28Click(Sender: TObject);
Var
i,j,i2, j2 : Integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      i2 := i + round(60 * sin(j/80));
      j2 := j + round(60 * cos(i/80));
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[i2,j2];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button29Click(Sender: TObject);
Var
i,j,i2, j2 : Integer;
begin
ProgressBar1.Max := Image1.height; ProgressBar1.Position := 0;
For i := 1 to image1.width do
  Begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      i2 := i - 100;
      j2 := j;
      Image2.Canvas.Pixels[i,j] := Image1.Canvas.Pixels[i2,j2];
    end;
end;
progressbar1.Position := 0;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
i,j,a,gray:integer;
r,g,b:byte;
c:TColor;
begin
  a:= scrollbar1.Position;
  j:=1;
  for i:=1 to Image1.Picture.Width do begin
  for j:=1 to Image1.Picture.Height do begin
        c:=Image1.Canvas.Pixels[i,j];
        r:=GetRValue(c);      // lehetne Green, Red is csak kicsit más szürke lenne
        g:=GetGValue(c);
        b:=GetBValue(c);
        gray:= Round ((0.299*r)+(0.587*g)+(0.144*b));
        if gray < a then gray:=0;
        if gray > a  then gray:=255;
        Image2.Canvas.Pixels[i,j]:= RGB (gray,gray,gray);
      end;
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
x,y,t,k1,k2,k: integer;
c: TColor;
r,g,b: byte;
begin
  for x:=0 to Image1.Picture.Width -1 do begin
  for y:=0 to Image1.Picture.Height -1 do
  begin
       c:= Form1.Image1.Canvas.Pixels[x,y];
       r:= GetRvalue(c);
       g:= GetGvalue(c);
       b:= GetBvalue(c);
       c:= Form1.Image1.Canvas.Pixels[x,y];
       r:= GetRvalue(c);
       g:= GetGvalue(c);
       b:= GetBvalue(c);
       k2:= Round((0.299*r) + (0.587*g) + (0.114*b));
       k:= Round((t*k1) + ((1-t)*k2));
       Form2.Image7.Canvas.Pixels[x,y]:= RGB(k,k,k);
       Form2.Show;
    end
 end
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button15Click(Sender: TObject);
Var
x, y : integer;
r1, g1, b1, r2, g2, b2 : Byte;
t: Real;
c: TColor;
r: byte;
g: byte;
b: byte;
begin
  Form3.Image1.Height := Image2.Height;
  Form3.Image1.Width := Image2.Width;
  ProgressBar1.Max := Image1.width; ProgressBar1.Position := 0;
  for x := 0 to image1.Width - 1 do
    begin
    t := x / Image1.Width;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    for y := 0 to Image1.Height - 1 do
    Begin
    c := Image1.Canvas.Pixels[x,y];
    r1 := (c and $0000FF);
    g1 := (c and $00FF00 shr 8);
    b1 := (c and $FF0000 shr 16);

    c := Image2.Canvas.Pixels[x,y];
    r2 := (c and $0000FF);
    g2 := (c and $00FF00 shr 8);
    b2 := (c and $FF0000 shr 16);

    r := Round((t*r1) + ((1 - t)*r2));
    g := Round((t*g1) + ((1 - t)*g2));
    b := Round((t*b1) + ((1 - t)*b2));
    Form3.Image1.Canvas.Pixels[x,y] := r + g shl 8 + b shl 16;
    end;
  end;
  Form3.Show;
end;

procedure TForm1.Button16Click(Sender: TObject);
Var
x, y : integer;
r1, g1, b1, r2, g2, b2 : Byte;
t: Real;
c: TColor;
r: byte;
g: byte;
b: byte;
begin
  Form3.Image1.Height := Image2.Height;
  Form3.Image1.Width := Image2.Width;
  ProgressBar1.Max := Image1.width; ProgressBar1.Position := 0;
  for x := 0 to image1.Width - 1 do
    begin
    t := 1/2;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    for y := 0 to Image1.Height - 1 do
    Begin
    c := Image1.Canvas.Pixels[x,y];
    r1 := (c and $0000FF);
    g1 := (c and $00FF00 shr 8);
    b1 := (c and $FF0000 shr 16);

    c := Image2.Canvas.Pixels[x,y];
    r2 := (c and $0000FF);
    g2 := (c and $00FF00 shr 8);
    b2 := (c and $FF0000 shr 16);

    r := Round((t*r1) + ((1 - t)*r2));
    g := Round((t*g1) + ((1 - t)*g2));
    b := Round((t*b1) + ((1 - t)*b2));
    Form3.Image1.Canvas.Pixels[x,y] := r + g shl 8 + b shl 16;
    end;
  end;
  Form3.Show;
end;

procedure TForm1.Button17Click(Sender: TObject);
Var
matrix           : array[0..8] of Integer;
konstanta_matice : Real;
i,j,c : integer;
begin

matrix[0] := StrToInt(Edit1.text);
matrix[1] := StrToInt(Edit2.text);
matrix[2] := StrToInt(Edit3.text);
matrix[3] := StrToInt(Edit4.text);
matrix[4] := StrToInt(Edit5.text);
matrix[5] := StrToInt(Edit6.text);
matrix[6] := StrToInt(Edit7.text);
matrix[7] := StrToInt(Edit8.text);
matrix[8] := StrToInt(Edit9.text);
konstanta_matice := 1;

For i := 1 to image1.Picture.width - 1 do
  Begin
  for j := 1 to image1.Picture.height - 1 do
   begin
      c :=
      Round(((GetRValue(Image1.Canvas.Pixels[i-1,j-1]) * matrix[0]) +
      (GetRValue(Image1.Canvas.Pixels[i,j-1])          * matrix[1]) +
      (GetRValue(Image1.Canvas.Pixels[i+1,j-1])        * matrix[2]) +
      (GetRValue(Image1.Canvas.Pixels[i-1,j])          * matrix[3]) +
      (GetRValue(Image1.Canvas.Pixels[i,j])            * matrix[4]) +
      (GetRValue(Image1.Canvas.Pixels[i+1,j])          * matrix[5]) +
      (GetRValue(Image1.Canvas.Pixels[i-1,j+1])        * matrix[6]) +
      (GetRValue(Image1.Canvas.Pixels[i,j+1])          * matrix[7]) +
      (GetRValue(Image1.Canvas.Pixels[i+1,j+1]) * matrix[8])) / konstanta_matice);
      if c > 255 then c := 255;
      If c < 0 Then c := 0;
      Image2.Canvas.Pixels[i,j] := RGB(c,c,c);
    end;
    //Image2.Repaint;
  end;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  Image1.Picture := nil;
  Image2.Picture := nil;
  Image3.Picture := nil;
  Image4.Picture := nil;
  Image5.Picture := nil;
  Image6.Picture := nil;
  Form2.Image7.Picture := nil;
  StaticText1.Visible := False;
  StaticText2.Visible := False;
  StaticText3.Visible := False;
  StaticText4.Visible := False;
  Label1.Visible:= False;
  Label2.Visible:= False;
  Label3.Visible:= False;
  Label4.Visible:= False;
  Label5.Visible:= False;
  Image1.Visible:= False;
  Image2.Visible:= False;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Image2.Visible:= True;
  OpenPictureDialog1.Execute;
  Image2.Picture.LoadFromFile(OpenPictureDialog1.Filename);
end;

procedure TForm1.Button10Click(Sender: TObject);
  var
i,j:integer;
r,g,b:byte;
c:TColor;
begin
  j:=1;
  for i:=1 to Image1.Picture.Width do begin
  for j:=1 to Image1.Picture.Height do begin
        c:=Image1.Canvas.Pixels[i,j];
        r:=GetRValue(c);
        r:=255-r;
        g:=GetGValue(c);
        g:=255-g;
        b:=GetBValue(c);
        b:=255-b;
        Image2.canvas.Pixels[i,j]:= RGB (r,g,b);
      end;
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);  //histogram
 var
a1, b1, i                   : Integer;
c                           : TColor;
r, g, b, svetlost           : Byte;
Histogram_jasu, Histogram_R : Histogram;
Histogram_G, Histogram_B    : Histogram;
begin
  StaticText1.Visible := True;
  StaticText2.Visible := True;
  StaticText3.Visible := True;
  StaticText4.Visible := True;
  for i := 1 to 256 do
  Begin
  Histogram_jasu[i] := 0;// brightness clear
  Histogram_R[i] := 0;   // R clear
  Histogram_G[i] := 0;   // G clear
  Histogram_B[i] := 0;   // B clear
  end;

  for a1 := 0 to Image1.Width-1 do
  Begin
    for b1 := 0 to Image1.Height-1 do
      Begin
        c := Image1.Canvas.Pixels[a1,b1];
        r := GetRValue(c);
        g := GetGValue(c);
        b := GetBValue(c);
        svetlost := trunc(r*RPodil + g*GPodil + b*BPodil);
        Histogram_jasu[svetlost] := Histogram_jasu[svetlost] + 1;
        Histogram_R[r] := Histogram_R[r] + 1;
        Histogram_G[g] := Histogram_G[g] + 1;
        Histogram_B[b] := Histogram_B[b] + 1;
        end;
  end;
  //Gray
  Begin
  Image3.Picture := nil;
  for i := 1 to 256 do
  Begin
  Image3.Canvas.Pen.Color := clSilver;
  Image3.Canvas.MoveTo(i, Image3.Height);
  Image3.Canvas.LineTo(i, Image3.Height - Trunc(Histogram_jasu[i]/20) + 1);
  end;
  end;

  // Red shades
  Begin
  for i := 1 to 256 do
  Begin
  Image4.Canvas.Pen.Color := clRed;
  Image4.Canvas.MoveTo(i, Image4.Height);
  Image4.Canvas.LineTo(i, Image4.Height - Trunc(Histogram_R[i]/20) + 1);
  end;
  end;

// Green shades
  Begin
  for I := 1 to 256 do
  Begin
  Image5.Canvas.Pen.Color := clGreen;
  Image5.Canvas.MoveTo(i, Image5.Height);
  Image5.Canvas.LineTo(i, Image5.Height - Trunc(Histogram_G[i]/20) + 1);
  end;
  end;

// Blue shades
  Begin
  for I := 1 to 256 do
  Begin
  Image6.Canvas.Pen.Color := clBlue;
  Image6.Canvas.MoveTo(i, Image6.Height);
  Image6.Canvas.LineTo(i, Image6.Height - Trunc(Histogram_B[i]/20) + 1);
  end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);  //clear canvases
begin
  //Image1.Picture := nil;
  Image2.Picture := nil;
  Image3.Picture := nil;
  Image4.Picture := nil;
  Image5.Picture := nil;
  Image6.Picture := nil;
  Form2.Image7.Picture := nil;
  StaticText1.Visible := False;
  StaticText2.Visible := False;
  StaticText3.Visible := False;
  StaticText4.Visible := False;
  Label1.Visible:= False;
  Label2.Visible:= False;
  Label3.Visible:= False;
  Label4.Visible:= False;
  Label5.Visible:= False;
  //Image1.Visible:= False;
  Image2.Visible:= False;
end;

procedure TForm1.Button3Click(Sender: TObject);  //save picture
begin
  if SavePictureDialog1.Execute then
    if FileExists(SavePictureDialog1.FileName) then
      showmessage('Fájl létezik. Válaszon más nevet.')
    else
      Image2.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);  //copy picture
begin
  if Image1.Visible = False then ShowMessage('Nincs kép');
  Image2.Visible:= True;
  Image2.Picture := Image1.Picture;
end;

procedure TForm1.Button5Click(Sender: TObject);   //red filter
var
i,j:integer;
r,g,b: byte;
c: TColor;
begin
  j:=1;
  for i:=1 to Image1.Picture.Width do begin
  for j:=1 to Image1.Picture.Height do begin
        c:=Image1.Canvas.Pixels[i,j];
        r:=GetRValue(c);
        Image2.canvas.Pixels[i,j]:= RGB (r,0,0);
      end;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);  //green filter
var
i,j: integer;
r,g,b: byte;
c: TColor;
begin
     j:=1;
     for i:=1 to Image1.Picture.Width do begin
     for j:=1 to Image1.Picture.Height do begin
     c:=Image1.Canvas.Pixels[i,j];
     g:= GetRValue(c);
     Image2.Canvas.Pixels[i,j]:= RGB (0,g,0);
     end;
end;
end;

procedure TForm1.Button7Click(Sender: TObject);  //blue filter
  var
i,j: integer;
r,g,b: byte;
c: TColor;
begin
     j:=1;
     for i:=1 to Image1.Picture.Width do begin
     for j:=1 to Image1.Picture.Height do begin
     c:=Image1.Canvas.Pixels[i,j];
     b:= GetRValue(c);
     Image2.Canvas.Pixels[i,j]:= RGB (0,0,b);
     end;
end;
end;

procedure TForm1.Button8Click(Sender: TObject); //gray filter
  var
i,j,gray:integer;
r,g,b:byte;
c:TColor;
begin
  j:=1;
  for i:=1 to Image1.Picture.Width do begin
  for j:=1 to Image1.Picture.Height do begin
        c:=Image1.Canvas.Pixels[i,j];
        r:=GetRValue(c);
        g:=GetGValue(c);
        b:=GetBValue(c);
        gray:= Round ((0.299*r)+(0.587*g)+(0.144*b));
        Image2.canvas.Pixels[i,j]:= RGB (gray,gray,gray);
      end;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);   //black and white
  var
  i,j,a,gray:integer;
  r,g,b:byte;
  c:TColor;
  begin
    a:= 100;
    j:=1;
    for i:=1 to Image1.Picture.Width do begin
    for j:=1 to Image1.Picture.Height do begin
          c:=Image1.Canvas.Pixels[i,j];
          r:=GetRValue(c);      // lehetne Green, Red is csak kicsit más szürke lenne
          g:=GetGValue(c);
          b:=GetBValue(c);
          gray:= Round ((0.299*r)+(0.587*g)+(0.144*b));
          if gray < a then gray:=0;
          if gray > a  then gray:=255;
          Image2.Canvas.Pixels[i,j]:= RGB (gray,gray,gray);
        end;
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label1.Visible:= False;
  Label2.Visible:= False;
  Label3.Visible:= False;
  Label4.Visible:= False;
  Label5.Visible:= False;
  StaticText1.Visible := False;
  StaticText2.Visible := False;
  StaticText3.Visible := False;
  StaticText4.Visible := False;
  Image1.Visible:= False;
  Image2.Visible:= False;
  ScrollBar1.Position := 0;
  ScrollBar2.Position := 0;
  Shape1.Brush.Color:= clLtGray;
  Shape2.Brush.Color:= clDkGray;
  Shape3.Brush.Color:= clDKGray;
  Shape4.Brush.Color:= clDkGray;
  Shape5.Brush.Color:= clDkGray;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton; //get rgb values
  Shift: TShiftState; X, Y: Integer);
begin
   Label3.Visible:= True;
   Label4.Visible:= True;
   Label5.Visible:= True;
   Label3.caption := 'R: ' + IntToStr(GetRValue(Image1.canvas.Pixels[x,y]));
   Label4.caption := 'G: ' + IntToStr(GetGvalue(Image1.canvas.Pixels[x,y]));
   Label5.caption := 'B: ' + IntToStr(GetBvalue(Image1.canvas.Pixels[x,y]));

end;

procedure TForm1.Image1MouseEnter(Sender: TObject);
begin
  Label1.Visible:= True;
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  Label1.Visible:=False;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Label3.Visible:= True;
   Label4.Visible:= True;
   Label5.Visible:= True;
   Label3.caption := 'R: ' + IntToStr(GetRValue(Image1.canvas.Pixels[x,y]));
   Label4.caption := 'G: ' + IntToStr(GetGvalue(Image1.canvas.Pixels[x,y]));
   Label5.caption := 'B: ' + IntToStr(GetBvalue(Image1.canvas.Pixels[x,y]));
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;


procedure TForm1.Image2MouseEnter(Sender: TObject);
begin
  Label2.Visible:= True;

end;

procedure TForm1.Image2MouseLeave(Sender: TObject);
begin
  Label2.VIsible:= False;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin

end;


procedure TForm1.Image8Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin

end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
var
i,j, gray: integer;
c: TColor;
r,g,b: byte;
begin
  ScrollBar1.Max := Image1.height; ScrollBar1.Position := 0;
For i := 1 to image1.picture.width do
  Begin
  ScrollBar1.Position := ScrollBar1.Position + 1;
  for j := 1 to image1.height do
    begin
      c := Image1.Canvas.Pixels[i,j];
      r := GetRvalue(c);
      g := GetGvalue(c);
      b := GetBvalue(c);
      gray := Round((0.299*r) + (0.587*g) + (0.114*b));
      gray := gray + Scrollbar1.position;
      // gray := gray - Scrollbar1.position;
      if gray > 255 Then gray := 255;
      Image2.Canvas.Pixels[i,j] := RGB(gray,gray,gray);
    end;
end;
ScrollBar1.Position := 0;
end;

procedure TForm1.ScrollBar5Change(Sender: TObject);
begin

end;

procedure TForm1.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.Shape2ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.Shape3ChangeBounds(Sender: TObject);
begin

end;


end.

