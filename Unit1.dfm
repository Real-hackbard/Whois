object Form1: TForm1
  Left = 336
  Top = 161
  Caption = 'Whois'
  ClientHeight = 459
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    690
    459)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 247
    Width = 38
    Height = 13
    Caption = 'Report :'
  end
  object Button2: TButton
    Left = 575
    Top = 409
    Width = 106
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Execute'
    TabOrder = 0
    TabStop = False
    OnClick = Button2Click
    ExplicitLeft = 571
    ExplicitTop = 408
  end
  object Memo1: TMemo
    Left = 8
    Top = 266
    Width = 673
    Height = 137
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitWidth = 669
    ExplicitHeight = 136
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 440
    Width = 690
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ExplicitTop = 439
    ExplicitWidth = 686
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 80
    Width = 374
    Height = 97
    Caption = ' Internet '
    TabOrder = 3
    DesignSize = (
      374
      97)
    object Label2: TLabel
      Left = 16
      Top = 47
      Width = 197
      Height = 13
      Caption = 'Example : (8.8.8.8)  or  (www.google.com)'
    end
    object Edit1: TEdit
      Left = 16
      Top = 66
      Width = 345
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = '8.8.8.8'
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 24
      Width = 33
      Height = 17
      Caption = 'IP'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 87
      Top = 24
      Width = 42
      Height = 17
      Caption = 'URL'
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 376
    Height = 66
    Caption = ' You must confirm the Service to use "Whois.exe" ! '
    TabOrder = 4
    object Button1: TButton
      Left = 248
      Top = 25
      Width = 115
      Height = 25
      Caption = 'Agree Whois'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 18
      Top = 27
      Width = 197
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Whois.exe'
      Items.Strings = (
        'Whois.exe'
        'Whois64.exe'
        'Whois64a.exe')
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 183
    Width = 376
    Height = 58
    Caption = ' Whois Service '
    TabOrder = 5
    object Label3: TLabel
      Left = 160
      Top = 26
      Width = 42
      Height = 13
      Caption = 'Service :'
    end
    object ComboBox2: TComboBox
      Left = 208
      Top = 23
      Width = 155
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      TabStop = False
      Text = 'whois.iana.org'
      Items.Strings = (
        'whois.iana.org'
        'whois.internic.net'
        'whois.denic.de')
    end
    object CheckBox2: TCheckBox
      Left = 18
      Top = 25
      Width = 76
      Height = 17
      TabStop = False
      Caption = 'No Banner'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 400
    Top = 8
    Width = 281
    Height = 233
    Caption = ' Geolocations '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Default'
      'Protocol Response'
      'Ignore HTTP Errors'
      'Remote Name'
      'Verbose'
      'Connection'
      'DNS'
      'FTP Protocol'
      'HTTP Protocol'
      'IMAP Protocol'
      'POP3 Protocol'
      'HTTP Post'
      'Proxy'
      'SCP Protocol'
      'SFTP Protocol'
      'SMTP Protocol'
      'SSH Protocol'
      'TELNET Protocol')
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 21
    Top = 409
    Width = 118
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Report Geolocation'
    Checked = True
    State = cbChecked
    TabOrder = 7
    ExplicitTop = 408
  end
end
