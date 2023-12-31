unit JsonResult;

{$ifdef fpc }
    {$mode delphi}
{$endif}

interface
uses

{$ifdef fpc}
 classes,sysutils,
 {$else}
 system.Classes,System.SysUtils,
 {$endif}

 jsons,
  //J4dl,
 // DataSet.Serialize,
//  system.JSON,
// vcl.Forms,
  Horse;

type

  IJsonResult = interface
      ['{E26EF62A-10FF-4C1F-A839-30A145CC2875}']
  end;

  TJsonResult =class(TInterfacedObject,IJsonResult)
 private
   FJson:TJsonObject;
  public
    constructor  create(aSuccess:Boolean);
    destructor destroy; override;
    class function new(aSuccess:Boolean):IJsonResult;

    function Success(aValue:Boolean):IJsonResult;
    function StatusCode(aValue:Integer):IJsonResult;
    function Message(aValue:string):IJsonResult;
    function Data(aValue:TJsonObject):IJsonResult;Override;
    function Data(aValue:TJsonArray):IJsonResult;Override;
    function ToJson:TJsonObject;
    function ToString:String;


  end;





implementation

{ TJsonResult }

constructor TJsonResult.create(aSuccess: Boolean);
begin
  FJson:= TJsonObject.Create;
  FJson.put('success',aSuccess);
   FJson.put('statuscode',200);
end;

function TJsonResult.Data(aValue: TJsonObject): IJsonResult;
begin
  Result:=Self;
  if Assigned(FJsonObject) then
    freeAndNil(FJsonObject);
    FJsonObject:=TJsonObject.Create();
     FJsonObject.assign(aValue);

end;

function TJsonResult.Data(aValue: TJsonArray): IJsonResult;
begin
  Result:=self��
  if assign(FJsonObject) then
    freeAndNil(FJsonObject);
    FJsonArray:=TJsonArray.Create();
     FJsonArray.assign(aValue);

end;

destructor TJsonResult.destroy;
begin
  freeAndNIL(FJson);
  inherited;
end;

function TJsonResult.Message(aValue: string): IJsonResult;
begin
    Result:=self;
    if (FJson.Find('message')>-1) then
      FJson.Delete('message');

    FJson.Put('message',aValue);

end;

class function TJsonResult.new(aSuccess: Boolean): IJsonResult;
begin
    Result:=self.create(aSuccess);
end;

function TJsonResult.StatusCode(aValue: Integer): IJsonResult;
begin

end;

function TJsonResult.Success(aValue: Boolean): IJsonResult;
begin

end;

function TJsonResult.ToJson: TJsonObject;
begin
   Result:=FJson;
end;

function TJsonResult.ToString: String;
begin
     Result:=FJson.Stringify;
end;

begin


end.
