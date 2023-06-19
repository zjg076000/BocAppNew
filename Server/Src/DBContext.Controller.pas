unit DBContext.Controller;

interface

uses system.Classes,system.SysUtils;

Type

 IDBContext=interface
   ['{C752E7DD-48B6-41CB-8618-5D43DC111692}']

 function connected:Boolean;Overload;
 function connected(Value:Boolean):IDBContext;OverLoad;
 function Instractionsaction:Boolean;
 function StartTranstransation:IDBContext;
 function Commit:IDBContext;
 function Rollback:IDBContext;

 function GetQuery:TComponent;
 function Paginate(aPage,ALimit:Integer):String;
 function GenGuid:string;
 function CheckDB:string;

  end;



implementation

end.
