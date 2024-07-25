object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'BCrypt Demo'
  ClientHeight = 441
  ClientWidth = 784
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 624
    object Label1: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 15
      Width = 764
      Height = 15
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Senha'
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 32
    end
    object edtSenha: TEdit
      AlignWithMargins = True
      Left = 10
      Top = 30
      Width = 764
      Height = 23
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 74
      ExplicitWidth = 121
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 70
    Width = 784
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    ExplicitTop = 521
    ExplicitWidth = 969
    object pnlGenerateHash: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 120
      Height = 34
      Cursor = crHandPoint
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Generate Hash'
      Color = 5540912
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      OnClick = pnlGenerateHashClick
    end
    object pnlCompareHash: TPanel
      AlignWithMargins = True
      Left = 129
      Top = 3
      Width = 330
      Height = 34
      Cursor = crHandPoint
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Compare Hash selecionado com a senha digitada'
      Color = 5540912
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      StyleElements = []
      OnClick = pnlCompareHashClick
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 113
    Width = 778
    Height = 325
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 520
    Top = 56
    object FDMemTable1senha: TStringField
      DisplayWidth = 20
      FieldName = 'senha'
      Size = 255
    end
    object FDMemTable1hash: TStringField
      DisplayWidth = 100
      FieldName = 'hash'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 552
    Top = 56
  end
end
