unit UCommon;

interface

uses
  system.DateUtils, winapi.windows, vcl.Forms,System.SysUtils;

var
  IsLogin:boolean;    //��¼�ɹ�


// get week
function GetWeek: string;
// ��ʱ����  sleep
procedure delay(MSecs: LongInt);






implementation

function GetWeek: string;
var
  mytime: SYSTEMTIME;
begin
  GetLocalTime(mytime);
  case mytime.wDayOfWeek of
    0:
      Result := '������';
    1:
      Result := '����һ';
    2:
      Result := '���ڶ�';
    3:
      Result := '������';
    4:
      Result := '������';
    5:
      Result := '������';
    6:
      Result := '������';
  end;
end;

//sleep

procedure delay(MSecs: LongInt);
var
  FirstTickCount, Now: LongInt;
begin
  FirstTickCount := GetTickCount();
  repeat
    Application.ProcessMessages;
    Now := GetTickCount();
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

end.
