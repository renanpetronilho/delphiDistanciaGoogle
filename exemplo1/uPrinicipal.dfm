object Form1: TForm1
  Left = 519
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 253
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 468
    Height = 169
    ReadOnly = True
    TabOrder = 3
  end
  object gpOrigem: TGroupBox
    Left = 8
    Top = 10
    Width = 177
    Height = 56
    Caption = 'Origem'
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label2: TLabel
      Left = 134
      Top = 15
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object edUFOrigem: TEdit
      Left = 133
      Top = 29
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 1
    end
    object edOrigem: TEdit
      Left = 6
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object gpDestino: TGroupBox
    Left = 200
    Top = 10
    Width = 177
    Height = 56
    Caption = 'Destino'
    TabOrder = 1
    object Label3: TLabel
      Left = 134
      Top = 15
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label4: TLabel
      Left = 6
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object edDestino: TEdit
      Left = 6
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edUFDestino: TEdit
      Left = 133
      Top = 29
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 1
    end
  end
  object btnBuscar: TBitBtn
    Left = 383
    Top = 10
    Width = 93
    Height = 56
    Caption = 'F9'
    DoubleBuffered = True
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      08000000000040020000120B0000120B0000000100000000000000000000FFFF
      FF00706C7D00FF00FF008770780093757B008A73770079696C008F7376007A58
      5600804A4400AA7974009E6E670097695F00A0746B00CFB6B1007A4335007D46
      380094675C00A57469008B524300B2847800B18E8400955D4B00A67565008B62
      5500A77B6B0068362300724534008562540070290A0057230D00682D12005B2A
      140069351F0089563E00622607007E513B00865E4A009C66480073534100B993
      7E00C0490100A95D2F009F6541009172600075706D00B2551500B4734600D0A7
      8C00CDA58B00EF640000D75B0000F36B0200E5660400C65A0A00BA743F00E369
      0200F36F0400F4700500ED6D0500F8750900F3740900E76E0900FF780D00FF7E
      1200EE751100F77E1800C9671800BD7B4700BF7F4900D8B59900D5680300F379
      0E00F57A0F00F47E1100F37E1200F37F1400FE841B009A541400FE963500CF7C
      3000D3863F00EAA36500F4801300F4861C00F78B2400EA862400F5912B00FA9A
      3B00DF893600F79A3C00FCA44B00FEA95500EBAC6C00EBAF7400EBB07600CFAF
      9000F4983600F69E4100FCB2650081634200E3BD9500846F5900DA821B00604B
      32006E594100D47E1000744E1A00E5A0440097744700F0C08300DAC4A700F4C7
      8900F2CD9600EACCA000FEF4E500D08E2600F4D19900E2C79C00FBD59000E0D0
      B500FFDE9C00EFD7A700FDE2A600F6DDA500D9B66500FFE19C00CDA94D00F7E3
      AF00FCEBB600FFEBA700FFEDAB00FEEEB200FCEEB600F8EBB600F2EBCA007973
      5400FEF2B200FBF4D000FDF5C300FDFAC900FFFEDB00FFFEC600FFFFCB00FFFF
      CC00FFFFCE00FFFFD000FFFFD300FFFFD400FFFFE600FFFFEB00FFFFFA00777C
      0C00737F12005D683D007F896200506910004D5A2D003F5F02008CAF4A00384D
      1F00274A02001E3E030050901D005081360070BC5400548E42001B6806001A7D
      090016540C00076E00000A7602002B9A23003A93340043973C007BC475003BAB
      350097DE93000364000062C95E000076000000710000006D000000690000004B
      000000410000014E0100035903000C890C000E8C0E001390130018961800187B
      180016651600239E23002DA92D0035AE35002E882E0042B641003AA33A00348E
      340048BB470056C4560066CF66009DF09D009CEF9C00A1F4A100007902000380
      0500037B0500047F0500128E130019961A0026A3270028A62A0031AA320041BB
      440046BC470046BB470049BA4B0057C7580058C7590060CE62006BD36D0071D9
      72007FDE800083E28400027F060013951A002CA5300046BF4A005FD0650056CB
      5D004AA4E10039A9FE0041AFFF0040ABFC004490C7008AABC600175A97001F5D
      9700379FFF003B608200185A99002D98FF00474E55007F848900195EA6002D8C
      F2003590EE00388CE60047688B001074F0001073EA00166DD100030303030303
      03030303030303030303030303030302F62E0303030303030303030303030303
      03030303030304F8F8F7030303030303032C2C27271765A5030303030306F0FD
      EBEE03030303033845464530306EAFC8C8AE030306F4FEF2EDFB030303515252
      5144372F4FA8C1C1C6C9C608F1FEF2EDFB0303035A5A573F3634342AA2BBB9BB
      BCC205F3FFF5ECFA03030303574B3A3A3C36370B0C0E0E0D0ABAFCFFF5EBF903
      030303564A3E494A424F261570888B79290907EFEAFC030303030354494D4E68
      9D1D0F969493948E9477152DF61C03030303494D555675A99E1601968F919292
      86846614211B250303034C555850A4E4197997959092929381717C1A221F1C03
      03035558596DADE50D889291929293937D5F7A32101F2203030356625C80D8E6
      128E91929292958C6F537A4711242003030358635DA0D9DC1288939393958C76
      5E5E833269A31E030303625C64A6E9CC1D70948D8D87726F72828518A1BCA203
      03035B5D7EB4E1E39C1A8F7C71605E7274984725AAB8B30303030380A6E8E3CF
      B267298A7F71788F010F176CB3B70303030303B1E7CCE3CDCEB0891331737B61
      0E142F9FB7B6030303030303D9DEE1E2E2E0CBA79B6A28232B4448ABB6030303
      0303030303CADDDFDFCBDBC5C3D4D29A433E39A803030303030303030303C7DA
      DAC7C5D6D5BDD099413B33030303030303030303030303D8C4D7C3C0BED1AC6B
      3D35030303030303030303030303030303D5BFBDD3B599400303030303030303
      0303030303030303030303030303030303030303030303030303}
    Layout = blGlyphRight
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object ActionList1: TActionList
    Left = 360
    Top = 88
    object ac_buscar: TAction
      Caption = 'ac_buscar'
      ShortCut = 120
      OnExecute = btnBuscarClick
    end
  end
end