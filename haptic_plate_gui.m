function varargout = haptic_plate_gui(varargin)
% HAPTIC_PLATE_GUI MATLAB code for haptic_plate_gui.fig
%      HAPTIC_PLATE_GUI, by itself, creates a new HAPTIC_PLATE_GUI or raises the existing
%      singleton*.
%
%      H = HAPTIC_PLATE_GUI returns the handle to a new HAPTIC_PLATE_GUI or the handle to
%      the existing singleton*.
%
%      HAPTIC_PLATE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAPTIC_PLATE_GUI.M with the given input arguments.
%
%      HAPTIC_PLATE_GUI('Property','Value',...) creates a new HAPTIC_PLATE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before haptic_plate_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to haptic_plate_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help haptic_plate_gui

% Last Modified by GUIDE v2.5 16-Sep-2016 17:33:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @haptic_plate_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @haptic_plate_gui_OutputFcn, ...
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

% --- Executes just before haptic_plate_gui is made visible.
function haptic_plate_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to haptic_plate_gui (see VARARGIN)
pts = [0:0.01:2*pi];
r = 135 % radius [mm]
x = r*cos(pts);
y = r*sin(pts);
plot(x,y, 'r');
% Choose default command line output for haptic_plate_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes haptic_plate_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = haptic_plate_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(gcf,'WindowButtonMotionFcn',@mouseMove);
set(gcf,'WindowButtonDownFcn', @mouseClick);
%cat = [C(1,1), C(1,2)]

function mouseMove (hobject,eventdata,handles)
handles.C = get(gca, 'CurrentPoint');
%guidata(hObject,handles);
title(gca,['X,Y Position = ',num2str(handles.C(1,1)), ', ',num2str(handles.C(1,2))]);

function mouseClick(hobject,eventdata,handles)
C = get(gca, 'CurrentPoint');
xlabel(gca,['Point chosen: ', num2str(C(1,1)), ', ',num2str(C(1,2))]);
x_y = [C(1,1),C(1,2)];
Copy_of_PlateExcite(x_y,x_y);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

str2double(get(hObject, 'String')) % Jeff: Returns number entered in textbox to command line

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- pseudocodes --- 
%if click <= max(x) && click <= max(y)
%   return x,y to simulink

%if mousehover <= max(x) && mousehover <= max(y)
%   return x,y to display
