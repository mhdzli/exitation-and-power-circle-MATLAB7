function varargout = exitationandpowercircles(varargin)
% EXITATIONANDPOWERCIRCLES M-file for exitationandpowercircles.fig
%      EXITATIONANDPOWERCIRCLES, by itself, creates a new EXITATIONANDPOWERCIRCLES or raises the existing
%      singleton*.
%
%      H = EXITATIONANDPOWERCIRCLES returns the handle to a new EXITATIONANDPOWERCIRCLES or the handle to
%      the existing singleton*.
%
%      EXITATIONANDPOWERCIRCLES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXITATIONANDPOWERCIRCLES.M with the given input arguments.
%
%      EXITATIONANDPOWERCIRCLES('Property','Value',...) creates a new EXITATIONANDPOWERCIRCLES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exitationandpowercircles_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exitationandpowercircles_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help exitationandpowercircles

% Last Modified by GUIDE v2.5 30-Dec-2018 12:20:23

% Begin initialization code - DO NOT EDIT12
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exitationandpowercircles_OpeningFcn, ...
                   'gui_OutputFcn',  @exitationandpowercircles_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT12


% --- Executes just before exitationandpowercircles is made visible.
function exitationandpowercircles_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exitationandpowercircles (see VARARGIN)

% Choose default command line output for exitationandpowercircles
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exitationandpowercircles wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exitationandpowercircles_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Vt1=str2double(get(handles.edit1,'string'));
Ra1=str2double(get(handles.edit2,'string'));
Xs1=str2double(get(handles.edit3,'string'));
P1=str2double(get(handles.edit4,'string'));
Ef1=str2double(get(handles.edit5,'string'));
Vt=Vt1*100;
Ra=Ra1*10;
Xs=Xs1*10;
P=P1*1000;
Efin=Ef1*100;
r=Vt/(2*Ra);
R=sqrt(Vt/(2*Ra)*Vt/(2*Ra)-P/Ra);
Pmax=Vt1*Vt1/(4*Ra1);
Zs=sqrt(Xs*Xs+Ra*Ra);
Efmin=(r-R)*Zs/100;
Efmax=(R+r)*Zs/100;
if P1>Pmax
 errordlg('(P>Pmax) so this curve dos not exist','wrong','modal')
elseif Efin>(R+r)*Zs
 errordlg('(Ef>Efmax) so this curve dos not exist','wrong','modal')
elseif Efin<(r-R)*Zs
 errordlg('(Ef<Efmin) so this curve dos not exist','wrong','modal')
else

 a=0
 b=r
 x=a-R:2*R/1000:a+R;
 z=x-a;
 y=sqrt(R.*R-z.*z)+b;
 
 axes(handles.axes4)
  plot(x,y,'r');
  hold on
  
  y=-sqrt(R.*R-z.*z)+b;
  plot(x,y,'r');
  
  x=a-r:2*r/1000:a+r;
  z=x-a;
  y=sqrt(r.*r-z.*z)+b;
  plot(x,y,'g');
  hold on
  y=-sqrt(r.*r-z.*z)+b;
  plot(x,y,'g');
  
  rm=3*r/4
  x=a-3*r/4:2*r/1000:a+3*r/4;
  z=x-a;
  y=sqrt(rm.*rm-z.*z)+b;
  plot(x,y,'c');
  y=-sqrt(rm.*rm-z.*z)+b;
  plot(x,y,'c');
  plot(a,b,'+');
  grid on
  axis([a-6*r/5 a+6*r/5 b-6*r/5 b+6*r/5])
  a=-Vt/(2*Zs);
  b=sqrt(r*r-Vt/(2*Zs)*Vt/(2*Zs));
 axes(handles.axes1)
    
  x=a-r:2*r/1000:a+r;
  z=x-a;
  y=sqrt(r.*r-z.*z)+b;
  plot(x,y,'g');
  hold on
  
  y=-sqrt(r.*r-z.*z)+b;
  plot(x,y,'g');
  
  R=sqrt(Vt/(2*Ra)*Vt/(2*Ra)-P/Ra);
  x=a-R:2*R/1000:a+R;
  z=x-a;
  y=sqrt(R.*R-z.*z)+b;
  plot(x,y,'r');
   
  y=-sqrt(R.*R-z.*z)+b;
  plot(x,y,'r');
  
  If=r+R;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  If=r-R;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  If=Efin/Zs;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  If=2*r;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  grid on
  
  axis([-2*r 2*r b-6*r/5 b+6*r/5])
  
 axes(handles.axes3)
  
  If=r+R;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  hold on
  
  If=Efin/Zs;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  hold on
    
  If=r-R;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  If=R;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  If=r;
  x=-If:2*If/1000:If;
  y=sqrt(If.*If-x.*x);
  plot(x,y);
  
  grid on
  
  axis([-Efmax*100/Zs-10 Efmax*100/Zs+10 0 Efmax*100/Zs+10])
  
 If=r-R:2*R/1000:r+R;
 A=4.*(a.*a+b.*b);
 B=-4.*(If.*If+a.*a+b.*b-R.*R).*a;
 w=(If.*If+a.*a+b.*b-R.*R);
 C=w.*w-4.*b.*b.*If.*If;
 x1=(-B-sqrt(B.*B-4.*A.*C))./(2.*A);
 x2=(-B+sqrt(B.*B-4.*A.*C))./(2.*A);
 y1=sqrt(If.*If-x1.*x1);
 y2=sqrt(If.*If-x2.*x2);
 Ia1=sqrt((Vt/Zs+x1).*(Vt/Zs+x1)+y1.*y1);
 Ia2=sqrt((Vt/Zs+x2).*(Vt/Zs+x2)+y2.*y2);
 
 axes(handles.axes2)
  plot(If,Ia1,'r');
  hold on
  plot(If,Ia2,'r');
  
  R=r;
  If=r-R:2*R/1000:r+R;
  A=4.*(a.*a+b.*b);
  B=-4.*(If.*If+a.*a+b.*b-R.*R).*a;
  w=(If.*If+a.*a+b.*b-R.*R);
  C=w.*w-4.*b.*b.*If.*If;
  x1=(-B-sqrt(B.*B-4.*A.*C))./(2.*A);
  x2=(-B+sqrt(B.*B-4.*A.*C))./(2.*A);
  y1=sqrt(If.*If-x1.*x1);
  y2=sqrt(If.*If-x2.*x2);
  Ia1=sqrt((Vt/Zs+x1).*(Vt/Zs+x1)+y1.*y1);
  Ia2=sqrt((Vt/Zs+x2).*(Vt/Zs+x2)+y2.*y2);
  plot(If,Ia1,'g');
  
  plot(If,Ia2,'g');
  
  r=Vt/(2*Ra);
  R=sqrt(Vt/(2*Ra)*Vt/(2*Ra)-P/Ra);
  Ifin=Efin/Zs;
  A=4.*(a.*a+b.*b);
  B=-4.*(Ifin.*Ifin+a.*a+b.*b-R.*R).*a;
  w=(Ifin.*Ifin+a.*a+b.*b-R.*R);
  C=w.*w-4.*b.*b.*Ifin.*Ifin;
  x1=(-B-sqrt(B.*B-4.*A.*C))./(2.*A);
  x2=(-B+sqrt(B.*B-4.*A.*C))./(2.*A);
  y1=sqrt(Ifin.*Ifin-x1.*x1);
  y2=sqrt(Ifin.*Ifin-x2.*x2);
  Ia1=sqrt((Vt/Zs+x1).*(Vt/Zs+x1)+y1.*y1);
  Ia2=sqrt((Vt/Zs+x2).*(Vt/Zs+x2)+y2.*y2);

  point1=Ia1;
  point2=Ia2;
  if Ia2>Ia1
    point=Ia2;
  else
    point=Ia1;
  end
  x=[Efin/Zs Efin/Zs];
  y=[0 point];
  plot(x,y,'b');
  x=[0 Efin/Zs];
  y=[point1 point1];
  plot(x,y,'k'),
  x=[0 Efin/Zs];
  y=[point2 point2];
  plot(x,y,'m');
  grid on
 axes(handles.axes1)
  x=[-Vt/Zs x2];
  y=[0 y2];
  plot(x,y,'m+-')
  
  x=[-Vt/Zs x1];
  y=[0 y1];
  plot(x,y,'k+-')

  x=[0 x1];
  y=[0 y1];
  plot(x,y,'b+-')
  
  x=[0 x2];
  y=[0 y2];
  plot(x,y,'b+-')

  x=[0 -Vt/Zs];
  y=[0 0];
  plot(x,y,'k+-')
  Ia1o=round(Ia1*10)/10;
  Ia2o=round(Ia2*10)/10;
set(handles.edit9,'string',Ia1o/10)
set(handles.edit10,'string',Ia2o/10)
end
  Pmaxo=round(Pmax*100)/100;
  Efmino=round(Efmin*100)/100;
  Efmaxo=round(Efmax*100)/100;
  Ro=round(R*100)/100;
  ro=round(r*100)/100;
set(handles.edit6,'string',Pmaxo)
set(handles.edit7,'string',Efmino)
set(handles.edit8,'string',Efmaxo)
set(handles.edit11,'string',Ro)
set(handles.edit12,'string',ro)
clc
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_response = modaldlg('Title','Confirm Close');
switch lower(user_response)
case 'no'
	% take no action
case 'yes'
	% Prepare to close GUI application window
	%                  .
	%                  .
	%                  .
	delete(handles.figure1)
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
hold off
x=0;
y=0;
plot(x,y);
axes(handles.axes2)
hold off
x=0;
y=0;
plot(x,y);
axes(handles.axes3)
hold off
x=0;
y=0;
plot(x,y);
axes(handles.axes4)
hold off
x=0;
y=0;
plot(x,y);




function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit12 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
