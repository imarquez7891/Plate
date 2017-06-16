function varargout = GUI_for_Ribbon_testing(varargin)
% GUI_FOR_RIBBON_TESTING MATLAB code for GUI_for_Ribbon_testing.fig
%      GUI_FOR_RIBBON_TESTING, by itself, creates a new GUI_FOR_RIBBON_TESTING or raises the existing
%      singleton*.
%
%      H = GUI_FOR_RIBBON_TESTING returns the handle to a new GUI_FOR_RIBBON_TESTING or the handle to
%      the existing singleton*.
%
%      GUI_FOR_RIBBON_TESTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FOR_RIBBON_TESTING.M with the given input arguments.
%
%      GUI_FOR_RIBBON_TESTING('Property','Value',...) creates a new GUI_FOR_RIBBON_TESTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_for_Ribbon_testing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_for_Ribbon_testing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help GUI_for_Ribbon_testing
 
% Last Modified by GUIDE v2.5 01-Nov-2016 19:13:46
                                                                                                                                                            
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_for_Ribbon_testing_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_for_Ribbon_testing_OutputFcn, ...
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
 
 
% --- Executes just before GUI_for_Ribbon_testing is made visible.
function GUI_for_Ribbon_testing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_for_Ribbon_testing (see VARARGIN)
 
% Choose default command line output for GUI_for_Ribbon_testing
% Rectangle function to easily create square-like plot
rectangle('Position', [0,0,45,100], 'FaceColor',[0 .5 .5],'EdgeColor', 'r', 'LineWidth',2);
xlabel('Point Chosen: ')
ylabel('Distance (cm)')
%Position: [starting_x, starting_y, width, height]
%EdgeColor: 'r' = red border, 'b' = blue border
axis([-5 50 -5 110])
 
set(gcf,'WindowButtonMotionFcn',@mouseMove);
set(gcf,'WindowButtonDownFcn', @mouseClick); %check this!!!
 
 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
 
function mouseMove(hObject,eventdata,handles)
handles.move = get(gca, 'CurrentPoint');
title(gca,['Y Position = ',num2str(handles.move(1,2))]);
guidata(hObject, handles);
 
function mouseClick(hObject,eventdata,handles)
handles.C = get(gca, 'CurrentPoint');
global y
y = handles.C(1,2);

if y > 100.0
    xlabel(gca,['Point Chosen: ', 'Out of Range']); 
    y = [];
else
    %send data value of GUI distance clicked
    xlabel(gca,['Current Position: ',num2str(y)]);
    end

Copy_of_RibbonExcite(y)

 
% UIWAIT makes GUI_for_Ribbon_testing wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = GUI_for_Ribbon_testing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;