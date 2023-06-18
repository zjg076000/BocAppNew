unit UCommon;

interface

uses
  system.DateUtils, winapi.windows, vcl.Forms,System.SysUtils;

var
  IsLogin:boolean;    //登录成功


// get week
function GetWeek: string;
// 延时函数  sleep
procedure delay(MSecs: LongInt);






implementation

function GetWeek: string;
var
  mytime: SYSTEMTIME;
begin
  GetLocalTime(mytime);
  case mytime.wDayOfWeek of
    0:
      Result := '星期日';
    1:
      Result := '星期一';
    2:
      Result := '星期二';
    3:
      Result := '星期三';
    4:
      Result := '星期四';
    5:
      Result := '星期五';
    6:
      Result := '星期六';
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
