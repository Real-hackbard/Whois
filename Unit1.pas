unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, ShellApi;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    CheckBox2: TCheckBox;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
    function ShellExecute_AndWait(FileName: string; Params: string): bool;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function TForm1.ShellExecute_AndWait(FileName: string; Params: string): bool;
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin

  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    exInfo.lpVerb := 'open';
    exInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.hProcess
  else
  begin
    ShowMessage(SysErrorMessage(GetLastError));
    Result := true;
    exit;
  end;
  while WaitForSingleObject(exInfo.hProcess, 50) <> WAIT_OBJECT_0 do
    Application.ProcessMessages;
  CloseHandle(Ph);
  Result := true;
end;

procedure TForm1.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;

           OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Whois\Whois.exe') then begin
  StatusBar1.Panels[0].Text := 'Whois.exe not found.';
  end else begin
  StatusBar1.Panels[0].Text := 'Whois.exe found.';
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not (FileExists(ExtractFilePath(Application.ExeName) + 'Whois\Whois.exe'))
  then begin
  MessageDlg('I cant find the Whois.exe, you need to download it.' + #10#13 +
             'microsoft.com/de-de/sysinternals/downloads/whois' + #10#13 +
             'Copy it to the "Whois" folder',mtError, [mbOK], 0);
  StatusBar1.Panels[1].Text := 'Error.';
  Exit;
  end;

    if ComboBox1.ItemIndex = 0 then begin
    StatusBar1.Panels[1].Text := 'Whois must be verified to use it..';
    ShellExecute_AndWait(PWideChar(ExtractFilePath(Application.ExeName) +
      'Whois\Whois.exe'), '');
    end;

    if ComboBox1.ItemIndex = 1 then begin
    StatusBar1.Panels[1].Text := 'Whois64 must be verified to use it..';
    ShellExecute_AndWait(PWideChar(ExtractFilePath(Application.ExeName) +
      'Whois\Whois64.exe'), '');
    end;

    if ComboBox1.ItemIndex = 2 then begin
    StatusBar1.Panels[1].Text := 'Whois64a must be verified to use it..';
    ShellExecute_AndWait(PWideChar(ExtractFilePath(Application.ExeName) +
      'Whois\Whois64a.exe'), '');
    end;

   StatusBar1.Panels[1].Text := 'Whois Confirm finish';
   StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Whois\Whois.exe') then begin
  MessageDlg('I cant find the Whois.exe.',mtError, [mbOK], 0);
  Exit;
  end;

  Screen.Cursor := crHourGlass;
  Memo1.Clear;
  StatusBar1.Panels[1].Text := 'Searching...';

  if (RadioButton1.Checked = true) or (RadioButton2.Checked = true) then
    begin
    if CheckBox2.Checked = true then begin

      if ComboBox1.ItemIndex = 0 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whois.exe  -nobanner ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;

      if ComboBox1.ItemIndex = 1 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whois64.exe -nobanner ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;

      if ComboBox1.ItemIndex = 2 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whoisa.exe -nobanner ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;
    end else begin
      if ComboBox1.ItemIndex = 0 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whois.exe ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;

      if ComboBox1.ItemIndex = 1 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whois64.exe ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;

      if ComboBox1.ItemIndex = 2 then begin
      CaptureConsoleOutput('cmd /c',
          'Whois\whoisa.exe ' + PChar(Edit1.Text) + ' ' + ComboBox2.Text, Memo1);
      end;
    end;
  end;

  if CheckBox1.Checked = true then begin

    case RadioGroup1.ItemIndex of
    0 : CaptureConsoleOutput('cmd /c','curl ipinfo.io/' + PChar(Edit1.Text), Memo1);
    1 : CaptureConsoleOutput('cmd /c','curl -i ipinfo.io/' + PChar(Edit1.Text), Memo1);
    2 : CaptureConsoleOutput('cmd /c','curl -f ipinfo.io/' + PChar(Edit1.Text), Memo1);
    3 : CaptureConsoleOutput('cmd /c','curl -O ipinfo.io/' + PChar(Edit1.Text), Memo1);
    4 : CaptureConsoleOutput('cmd /c','curl -v ipinfo.io/' + PChar(Edit1.Text), Memo1);
    5 : CaptureConsoleOutput('cmd /c','curl connection ipinfo.io/' + PChar(Edit1.Text), Memo1);
    6 : CaptureConsoleOutput('cmd /c','curl dns ipinfo.io/' + PChar(Edit1.Text), Memo1);
    7 : CaptureConsoleOutput('cmd /c','curl ftp ipinfo.io/' + PChar(Edit1.Text), Memo1);
    8 : CaptureConsoleOutput('cmd /c','curl http ipinfo.io/' + PChar(Edit1.Text), Memo1);
    9 : CaptureConsoleOutput('cmd /c','curl imap ipinfo.io/' + PChar(Edit1.Text), Memo1);
    10 : CaptureConsoleOutput('cmd /c','curl pop3 ipinfo.io/' + PChar(Edit1.Text), Memo1);
    11 : CaptureConsoleOutput('cmd /c','curl post ipinfo.io/' + PChar(Edit1.Text), Memo1);
    12 : CaptureConsoleOutput('cmd /c','curl proxy ipinfo.io/' + PChar(Edit1.Text), Memo1);
    13 : CaptureConsoleOutput('cmd /c','curl scp ipinfo.io/' + PChar(Edit1.Text), Memo1);
    14 : CaptureConsoleOutput('cmd /c','curl sftp ipinfo.io/' + PChar(Edit1.Text), Memo1);
    15 : CaptureConsoleOutput('cmd /c','curl smtp ipinfo.io/' + PChar(Edit1.Text), Memo1);
    16 : CaptureConsoleOutput('cmd /c','curl ssh ipinfo.io/' + PChar(Edit1.Text), Memo1);
    17 : CaptureConsoleOutput('cmd /c','curl telnet ipinfo.io/' + PChar(Edit1.Text), Memo1);
    end;

  end;
  StatusBar1.SetFocus;
  StatusBar1.Panels[1].Text := 'Process finish';
  Screen.Cursor := crDefault;
end;




end.
