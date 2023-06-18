unit DockUtils;
//Download by 链接已屏蔽
interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, Tabs,Vcl.ComCtrls,RzTabs;

const
  UM_DOCKFORMCLOSE = WM_USER + 1;

type
  TDockTabSheet = class(TrzTabSheet)
  protected
    procedure UMDOCKFORMCLOSE(var message: TMessage); message UM_DOCKFORMCLOSE;
  end;

  procedure ShowDockForm(FormClass: TFormClass; dockCtrl: TWinControl);

implementation


procedure ShowDockForm(FormClass: TFormClass; dockCtrl: TWinControl);

  procedure ShowCaption(ParentCtrl: TWinControl; ACaption: string);
  begin
    if ParentCtrl is TrzTabSheet then
    begin
      TrzTabSheet(ParentCtrl).Caption := ACaption;
      //TTabSheet(ParentCtrl).TabVisible:=false;
    end;
  end;

var
  I: Integer;
  TabCtrl: TDockTabSheet;
  Form: TForm;
begin
  Screen.Cursor := crHourGlass;
  TabCtrl := nil;
  try
    for i := 0 to Screen.CustomFormCount - 1 do
      //if Screen.CustomForms[i] is FormClass then
      if Screen.CustomForms[i].ClassName = FormClass.ClassName then
      begin
        if (not (Screen.CustomForms[i]).Visible) then
          (Screen.CustomForms[i]).Visible := True;
        (Screen.CustomForms[i]).BringToFront;
        (Screen.CustomForms[i]).SetFocus;
        TabCtrl := TDockTabSheet(Screen.CustomForms[i].Parent);
        ShowCaption(TabCtrl, Screen.CustomForms[i].Caption);
        TrzPageControl(dockCtrl).ActivePageIndex := TabCtrl.PageIndex;
      //  TrzPageControl(dockCtrl).ActivePage.ImageIndex:=
        exit;
      end;

    //查找空闲页。要想让新增加的窗口在最右边，只有先释放这些page[i]
    for I := 0 to TrzPageControl(dockCtrl).PageCount - 1 do    // Iterate
    begin
      if not TrzPageControl(dockCtrl).Pages[i].TabVisible then
      begin
        TabCtrl := TDockTabSheet(TrzPageControl(dockCtrl).Pages[i]);
        TabCtrl.TabVisible := true;
        break;
      end;
    end;    // for
    //如果没有找到空闲页，则创建
    if TabCtrl = nil then
    begin
      TabCtrl := TDockTabSheet.Create(dockCtrl); //dockCtrl
      TabCtrl.PageControl := TrzPageControl(dockCtrl);
    end;
    TrzPageControl(dockCtrl).ActivePageIndex := TabCtrl.PageIndex;

    Form := FormClass.Create(TabCtrl);
    LockWindowUpdate(TabCtrl.PageControl.Handle);
    with Form do
    try
      ManualDock(TabCtrl);
      ShowCaption(TabCtrl, Caption);

      Show;
      Form.WindowState := wsMaximized;
      Form.Align := alClient;
    //  TabCtrl.data := Form; //关闭时通知owner
    except
      Free;
    end;
  finally
    LockWindowUpdate(0);
    Screen.Cursor := crDefault;
  end;
end;


{ TDockTabSheet }

procedure TDockTabSheet.UMDOCKFORMCLOSE(var message: TMessage);
var
  tmpIndex: integer;
begin
  tmpIndex := self.TabIndex;
  //self.FreeNotification(self.PageControl);
  //PageControl.RemoveFreeNotification(self);
  //PageControl.RemoveComponent(self);
  //PageControl.CloseActiveTab;
  //可以改源代码，来获得通知关闭消息，但这样做改动太大，
  self.TabVisible := false;
//  self.Data := nil;

  if PageControl.PageCount >= tmpIndex + 1 then
    PageControl.ActivePageIndex := tmpIndex + 1
  else
    PageControl.ActivePageIndex := tmpIndex - 1;

end;

end.
﻿
