function varargout = robot(varargin)
% ROBOT MATLAB code for robot.fig
%      ROBOT, by itself, creates a new ROBOT or raises the existing
%      singleton*.
%
%      H = ROBOT returns the handle to a new ROBOT or the handle to
%      the existing singleton*.
%
%      ROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOT.M with the given input arguments.
%
%      ROBOT('Property','Value',...) creates a new ROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robot

% Last Modified by GUIDE v2.5 31-Jul-2017 09:46:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robot_OpeningFcn, ...
                   'gui_OutputFcn',  @robot_OutputFcn, ...
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


% --- Executes just before robot is made visible.
function robot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robot (see VARARGIN)

% Choose default command line output for robot
handles.output = hObject;
global x ; 
x = [0,30,0,0;0,0,25,0;0,0,15,0;0,-30,0,0];
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes robot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = robot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global x ;
qi=[x(1,1),x(2,1),x(3,1),x(4,1)];
L(1)=Link(x(1,:));
L(2)=Link(x(2,:));
L(3)=Link(x(3,:));
L(4)=Link(x(4,:));
pum=SerialLink(L);
pum.plot(qi);






% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in joint1add.
function joint1add_Callback(hObject, eventdata, handles)
% hObject    handle to joint1add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(1,1)=x(1,1)+0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);






% --- Executes on button press in joint2add.
function joint2add_Callback(hObject, eventdata, handles)
% hObject    handle to joint2add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(3,1)=x(3,1)+0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);

% --- Executes on button press in joint3add.
function joint3add_Callback(hObject, eventdata, handles)
% hObject    handle to joint3add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(4,2)=x(4,2)-1;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on button press in joint4add.
function joint4add_Callback(hObject, eventdata, handles)
% hObject    handle to joint4add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(4,1)=x(4,1)+0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on button press in joint1dec.
function joint1dec_Callback(hObject, eventdata, handles)
% hObject    handle to joint1dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(1,1)=x(1,1)-0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on button press in joint2dec.
function joint2dec_Callback(hObject, eventdata, handles)
% hObject    handle to joint2dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(3,1)=x(3,1)-0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on button press in joint3dec.
function joint3dec_Callback(hObject, eventdata, handles)
% hObject    handle to joint3dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(4,2)=x(4,2)+1;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on button press in joint4dec.
function joint4dec_Callback(hObject, eventdata, handles)
% hObject    handle to joint4dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x(4,1)=x(4,1)-0.2;
axes1_CreateFcn();
quatemion_CreateFcn(handles.quatemion, eventdata, handles);


% --- Executes on key press with focus on joint1add and none of its controls.
function joint1add_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to joint1add (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in quatemion.
function quatemion_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to quatemion (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)






% --- Executes during object creation, after setting all properties.
function quatemion_CreateFcn(k, eventdata, handles)
% hObject    handle to quatemion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global x;
set(k,'data',x);


% --- Executes during object creation, after setting all properties.
function axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axis


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
x=0:1:100;
y=x;
plot(x,y);

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object deletion, before destroying properties.
function axes2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,y]=ginput(2);
plot(x,y,'g');
axis([-500 500 -500 500]);
hold on;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=0:1:100;
y=x;
plot(x,y);
