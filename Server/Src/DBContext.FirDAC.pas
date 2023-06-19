unit DBContext.FirDAC;

interface
uses System.Classes,System.SysUtils,
FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.SQLite, Data.DB,
  FireDAC.Comp.Client;


Type

  IDBContext = interface
    ['{688E0613-EFE0-495A-9906-0767E9038774}']
  end;

  TDBContextFirDAC=class(TInterfacedObject,IDBContext)
  private
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;

    procedure  OnBeforeConnect(sender:TObject);

  public
    constructor create;
    destructor Destroy;override;
    class function New:IDBContext;

     function Connected: boolean;overLoad;
     function Connected(Value:boolean):IDBContext; OverLoad;

     function InStransaction:Boolean;
     function StartStransaction:IDBContext;
     function Commit:IDBContext;
     function Rollback:IDBContext;

     function GetQuery:TComponent;
     function Paginate(aPage£¬aLimit:Integer):string;
     function GenGuid:String;
     function CheckDB:String;


  end;


implementation
  USES  DBEnv;
{ TDBContextFirDAC }

function TDBContextFirDAC.CheckDB: String;
begin

end;

function TDBContextFirDAC.Commit: IDBContext;
begin
   Result:=self;
   FDconnection.Commit;
end;

function TDBContextFirDAC.Connected(Value: boolean): IDBContext;
begin
  Result:=self;
  FDconnection.Connected:=value;
end;

function TDBContextFirDAC.Connected: boolean;
begin
   Result:=FDConnection.Connected;

end;

constructor TDBContextFirDAC.create;
begin
   FDConnection:=TFDConnection.Create(nil);
   FDConnection.BeforeConnect:=OnBeforeConnect;
   FDPhysSQLiteDriverLink:=TFDPhysSQLiteDriverLink.Create(nil);
   FDGUIxWaitCursor:=TFDGUIxWaitCursor.Create(nil);
end;

destructor TDBContextFirDAC.Destroy;
begin
  FDConnection.Connected:=false;
  freeandNil(FDConnection);
  freeandNil(FDPhysSQLiteDriverLink);
  freeandNil(FDGUIxWaitCursor);
  inherited;
end;

function TDBContextFirDAC.GenGuid: String;
begin

end;

function TDBContextFirDAC.GetQuery: TComponent;
begin

end;

function TDBContextFirDAC.InStransaction: Boolean;
begin

end;

class function TDBContextFirDAC.New: IDBContext;
begin

end;

procedure TDBContextFirDAC.OnBeforeConnect(sender: TObject);
begin
   FDConnection.Params.DriverID:=DBEnv.DB_DRIVER_ID;
   FDConnection.Params.Database:=DBEnv.DB_DATABASE;
end;

function TDBContextFirDAC.Paginate(aPage£¬aLimit: Integer): string;
begin

end;

function TDBContextFirDAC.Rollback: IDBContext;
begin
   Result:=self;
   if FDConnection.InTransaction then
        FDConnection.Rollback;

end;

function TDBContextFirDAC.StartStransaction: IDBContext;
begin
  Result:=self;
  FDConnection.Connected:=false;
   FDConnection.Connected:=true;
   FDConnection.StartTransaction;

end;

end.
