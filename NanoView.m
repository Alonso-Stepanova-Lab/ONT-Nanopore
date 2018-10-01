function varargout = NanoView(varargin)
% NANOVIEW MATLAB code for NanoView.fig
%      NANOVIEW, by itself, creates a new NANOVIEW or raises the existing
%      singleton*.
%
%      H = NANOVIEW returns the handle to a new NANOVIEW or the handle to
%      the existing singleton*.
%
%      NANOVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NANOVIEW.M with the given input arguments.
%
%      NANOVIEW('Property','Value',...) creates a new NANOVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NanoView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NanoView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NanoView

% Last Modified by GUIDE v2.5 22-Sep-2018 19:27:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NanoView_OpeningFcn, ...
                   'gui_OutputFcn',  @NanoView_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before NanoView is made visible.
function NanoView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NanoView (see VARARGIN)

% Choose default command line output for NanoView
handles.output = hObject;

scale1=1;
handles.scale1=scale1;
scale2=1;
handles.scale2=scale2;
scale3=1;
handles.scale3=scale3;
scale4=1;
handles.scale4=scale4;
scale5=1;
handles.scale5=scale5;
window1=0;
handles.window1=window1;
window2=0;
handles.window2=window2;
window3=0;
handles.window3=window3;
window4=0;
handles.window4=window4;
window5=0;
handles.window5=window5;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NanoView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NanoView_OutputFcn(hObject, eventdata, handles) 
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
scale1=handles.scale1;
axes(handles.axes1) 
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
            file=strcat(pathname,filename);
            c=strsplit(file,'_');
            read=char(c{end-3});
            atributo=strcat('/Raw/Reads/Read_',read,'/Signal');
            data1=h5read(file,atributo);
            axes(handles.axes1) 

x=numel(data1);           
plot(data1);
ylim([300 1500]);
xlim([0 x*scale1]);
drawnow;          

handles.scale1=scale1;
            
            

handles.data1=data1;

% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window1=handles.window1;
axes(handles.axes1) 
scale1=get(hObject,'Value');
scale1=abs(scale1-1);
data1=handles.data1;
x=numel(data1);           
plot(data1(floor(x*(window1+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale1+0.0001)]);
drawnow;          

handles.scale1=scale1;

% Update handles structure
guidata(hObject, handles);




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
scale1=handles.scale1;
axes(handles.axes1) 
window1=get(hObject,'Value');
data1=handles.data1;
x=numel(data1);           
plot(data1(floor(x*(window1+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale1+0.0001)]);
drawnow;          

handles.scale1=scale1;
handles.window1=window1;

% Update handles structure
guidata(hObject, handles);

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale2=handles.scale2;
axes(handles.axes2) 
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
            file=strcat(pathname,filename);
            c=strsplit(file,'_');
            read=char(c{end-3});
            atributo=strcat('/Raw/Reads/Read_',read,'/Signal');
            data2=h5read(file,atributo);
x=numel(data2);           
plot(data2);
ylim([300 1500]);
xlim([0 x*scale2]);
drawnow;          

handles.scale2=scale2;
handles.data2=data2;


% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window2=handles.window2;
axes(handles.axes2) 
scale2=get(hObject,'Value');
scale2=abs(scale2-1);
data2=handles.data2;
x=numel(data2);           
plot(data2(floor(x*(window2+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*scale2]);
drawnow;          

handles.scale2=scale2;
% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale2=handles.scale2;
axes(handles.axes2) 
window2=get(hObject,'Value');
data2=handles.data2;
x=numel(data2);           
plot(data2(floor(x*(window2+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale2+0.0001)]);
drawnow;          

handles.scale2=scale2;
handles.window2=window2;

% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale3=handles.scale3;
axes(handles.axes3) 
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
            file=strcat(pathname,filename);
            c=strsplit(file,'_');
            read=char(c{end-3});
            atributo=strcat('/Raw/Reads/Read_',read,'/Signal');
            data3=h5read(file,atributo);
x=numel(data3);           
plot(data3);
ylim([300 1500]);
xlim([0 x*scale3]);
drawnow;          

handles.scale3=scale3;
handles.data3=data3;
% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window3=handles.window3;
axes(handles.axes3) 
scale3=get(hObject,'Value');
scale3=abs(scale3-1);
data3=handles.data3;
x=numel(data3);           
plot(data3(floor(x*(window3+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*scale3]);
drawnow;          

handles.scale3=scale3;
% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale3=handles.scale3;
axes(handles.axes3) 
window3=get(hObject,'Value');
data3=handles.data3;
x=numel(data3);           
plot(data3(floor(x*(window3+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale3+0.0001)]);
drawnow;          

handles.scale3=scale3;
handles.window3=window3;

% Update handles structure
guidata(hObject, handles);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes4);
scale4=handles.scale4;
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
            file=strcat(pathname,filename);
            c=strsplit(file,'_');
            read=char(c{end-3});
            atributo=strcat('/Raw/Reads/Read_',read,'/Signal');
            data4=h5read(file,atributo);
            
x=numel(data4);           
plot(data4);
ylim([300 1500]);
xlim([0 x*scale4]);
drawnow;            

handles.data4=data4;
% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window4=handles.window4;
axes(handles.axes4) 
scale4=get(hObject,'Value');
scale4=abs(scale4-1);
data4=handles.data4;
x=numel(data4);           
plot(data4(floor(x*(window4+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*scale4]);
drawnow;          

handles.scale4=scale4;
% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale4=handles.scale4;
axes(handles.axes4) 
window4=get(hObject,'Value');
data4=handles.data4;
x=numel(data4);           
plot(data4(floor(x*(window4+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale4+0.0001)]);
drawnow;          

handles.scale4=scale4;
handles.window4=window4;

% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes5);
scale5=handles.scale5;
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
            file=strcat(pathname,filename);
            c=strsplit(file,'_');
            read=char(c{end-3});
            atributo=strcat('/Raw/Reads/Read_',read,'/Signal');
            data5=h5read(file,atributo);
x=numel(data5);           
plot(data5);
ylim([300 1500]);
xlim([0 x*scale5]);
drawnow;          

handles.scale5=scale5;
handles.data5=data5;

% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window5=handles.window5;
axes(handles.axes5);
scale5=get(hObject,'Value');
scale5=abs(scale5-1);
data5=handles.data5;
x=numel(data5);           
plot(data5(floor(x*(window5+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*scale5]);
drawnow;          

handles.scale5=scale5;
% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale5=handles.scale5;
axes(handles.axes5) 
window5=get(hObject,'Value');
data5=handles.data5;
x=numel(data5);           
plot(data5(floor(x*(window5+0.0001)):x,1));
ylim([300 1500]);
xlim([0 x*(scale5+0.0001)]);
drawnow;          

handles.scale5=scale5;
handles.window5=window5;

% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
