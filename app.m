function varargout = app(varargin)
% APP MATLAB code for app.fig
%      APP, by itself, creates a new APP or raises the existing
%      singleton*.
%
%      H = APP returns the handle to a new APP or the handle to
%      the existing singleton*.
%
%      APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP.M with the given input arguments.
%
%      APP('Property','Value',...) creates a new APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app

% Last Modified by GUIDE v2.5 03-Jul-2020 16:37:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_OpeningFcn, ...
                   'gui_OutputFcn',  @app_OutputFcn, ...
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


% --- Executes just before app is made visible.
function app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app (see VARARGIN)


% Choose default command line output for app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editTextFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to editTextFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextFuncion as text
%        str2double(get(hObject,'String')) returns contents of editTextFuncion as a double


% --- Executes during object creation, after setting all properties.
function editTextFuncion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextLimInf_Callback(hObject, eventdata, handles)
% hObject    handle to editTextLimInf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimInf

LimInf= str2double(get(hObject,'String'));


% Hints: get(hObject,'String') returns contents of editTextLimInf as text
%        str2double(get(hObject,'String')) returns contents of editTextLimInf as a double


% --- Executes during object creation, after setting all properties.
function editTextLimInf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextLimInf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextLimSup_Callback(hObject, eventdata, handles)
% hObject    handle to editTextLimSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimSup
LimSup = str2double(get(hObject,'String'))

% Hints: get(hObject,'String') returns contents of editTextLimSup as text
%        str2double(get(hObject,'String')) returns contents of editTextLimSup as a double


% --- Executes during object creation, after setting all properties.
function editTextLimSup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextLimSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnGraficar.
function BtnGraficar_Callback(hObject, eventdata, handles)
global LimInf LimSup

Func = get(handles.editTextFuncion,'String') 
Infe=  get(handles.editTextLimInf,'String') 
Supe=   get(handles.editTextLimSup,'String') 

Func_A=isempty(Func);
Infe_A=isempty(Infe);   %Me devuelve un valor de 0 o 1 si existe o no una cadena de caracteres 
Supe_A=isempty(Supe);   % en el EditText de mi elección 

if Func_A && Infe_A && Supe_A == 1
    set(handles.StaticTextCalculo,'String','Inserte Función y Límites');
else
    ezplot(handles.axesGraficar,Func,[LimInf LimSup]);
    grid minor
    title('Función F(t)');
end






% --- Executes during object creation, after setting all properties.
function PopUpCalculo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopUpCalculo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextInt_Callback(hObject, eventdata, handles)
% hObject    handle to editTextInt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextInt as text
%        str2double(get(hObject,'String')) returns contents of editTextInt as a double


% --- Executes during object creation, after setting all properties.
function editTextInt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextInt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimInferior_2_Callback(hObject, eventdata, handles)
% hObject    handle to LimInferior_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimInt_Inferior

LimInt_Inferior= str2double(get(hObject,'String'));

% Hints: get(hObject,'String') returns contents of LimInferior_2 as text
%        str2double(get(hObject,'String')) returns contents of LimInferior_2 as a double


% --- Executes during object creation, after setting all properties.
function LimInferior_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimInferior_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextIntSup_Callback(hObject, eventdata, handles)
% hObject    handle to editTextIntSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextIntSup as text
%        str2double(get(hObject,'String')) returns contents of editTextIntSup as a double


% --- Executes during object creation, after setting all properties.
function editTextIntSup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextIntSup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimSuperior_2_Callback(hObject, eventdata, handles)
% hObject    handle to LimSuperior_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimInt_Superior

LimInt_Superior= str2double(get(hObject,'String'));

% Hints: get(hObject,'String') returns contents of LimSuperior_2 as text
%        str2double(get(hObject,'String')) returns contents of LimSuperior_2 as a double


% --- Executes during object creation, after setting all properties.
function LimSuperior_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimSuperior_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BotonIntegralDefinida.
function BotonIntegralDefinida_Callback(hObject, eventdata, handles)
% hObject    handle to BotonIntegralDefinida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BotonDerivar_3.
function BotonDerivar_3_Callback(hObject, eventdata, handles)
% hObject    handle to BotonDerivar_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Nivel_Derivada

Funci = get(handles.editTextFuncion,'String')
N=isempty(Nivel_Derivada)
Ver_A=isempty(Funci)
Funci1 = replace(Funci,'.^','^');
Funci2 = replace(Funci1,'.*','*');
Funci3 = replace(Funci2,'./','/');
syms t


if Ver_A==1 && Nivel_Derivada>0
    set(handles.StaticTextCalculo,'String','Ingrese Función')
    set(handles.GradoDerivada_2,'String','0')
else
    if N==1
    dFunc = diff(Funci3,t,1);
    set(handles.StaticTextCalculo,'String',char(dFunc));
    set(handles.GradoDerivada_2,'String','1')
    end
    if Nivel_Derivada>=1
    dFunc = diff(Funci3,t,Nivel_Derivada);
    set(handles.StaticTextCalculo,'String',char(dFunc));
    set(handles.GradoDerivada_2,'String',Nivel_Derivada)
    end
end



    







function GradoDerivada_2_Callback(hObject, eventdata, handles)
% hObject    handle to GradoDerivada_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Nivel_Derivada

Nivel_Derivada= str2double(get(hObject,'String'));

% Hints: get(hObject,'String') returns contents of GradoDerivada_2 as text
%        str2double(get(hObject,'String')) returns contents of GradoDerivada_2 as a double


% --- Executes during object creation, after setting all properties.
function GradoDerivada_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GradoDerivada_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BotonIntegrar_3.
function BotonIntegrar_3_Callback(hObject, eventdata, handles)
% hObject    handle to BotonIntegrar_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 Inf = get(handles.LimInferior_2,'String')
 Sup = get(handles.LimSuperior_2,'String')
 
 Func = get(handles.editTextFuncion,'String')
 Func11 = replace(Func,'.^','^');
 Func12 = replace(Func11,'.*','*');
 Func13 = replace(Func12,'./','/');
 syms t;
 Ver_A=isempty(Sup);
 Ver_B=isempty(Inf);
 
 if Ver_A && Ver_B ==1
      set(handles.StaticTextCalculo,'String','Inserte Límites de Integración');
     
 else
    iFunc1 =int(Func13,t,Inf,Sup);
    set(handles.StaticTextCalculo,'String',char(iFunc1));
 end
 






% --- Executes during object creation, after setting all properties.
function BotonDerivar_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BotonDerivar_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Graficar_2.
function Graficar_2_Callback(hObject, eventdata, handles)
% hObject    handle to Graficar_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimInf LimSup

Ts=1e-3;

t=LimInf:Ts:LimSup;
Funcion = get(handles.editTextFuncion,'String') 
% axes(handles.axesGraficar); %Axes donde quiero graficar
% plot(t,eval(Func))

Derivada = get(handles.StaticTextCalculo,'String');
%axes(handles.axesGraficar);
ezplot(handles.axesGraficar,Derivada,[LimInf LimSup]);
hold on
title('Derivada de F(t)')
ezplot(handles.axesGraficar,Funcion,[LimInf LimSup]);
hold on
title('Derivada de F(t)')
grid minor
       


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Limpiar.
function Limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Calc_Matrices.
function Calc_Matrices_Callback(hObject, eventdata, handles)
% hObject    handle to Calc_Matrices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(app);
app_2


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.editTextFuncion,'String','');
set(handles.editTextLimInf,'String','');
set(handles.editTextLimSup,'String','');



% --- Executes during object creation, after setting all properties.
function axesGraficar_CreateFcn(hObject, eventdata, handles)

title('Función f(t)')
ylabel('f(t)');
xlabel('t');
grid on


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


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
Valor=get(hObject,'Value');
set(handles.StaticTextCalculo,'String',Valor);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LimInf LimSup

Func = get(handles.editTextFuncion,'String') 
Infe=  get(handles.editTextLimInf,'String') 
Supe=   get(handles.editTextLimSup,'String') 

Func_A=isempty(Func);
Infe_A=isempty(Infe);   %Me devuelve un valor de 0 o 1 si existe o no una cadena de caracteres 
Supe_A=isempty(Supe);   % en el EditText de mi elección 

if Func_A && Infe_A && Supe_A == 1
    set(handles.StaticTextCalculo,'String','Inserte Función y Límites');
else
    ezplot(handles.axesGraficar,Func,[LimInf LimSup]);
    grid minor
    title('Función F(t)');
end


% --- Executes on button press in Home_1.
function Home_1_Callback(hObject, eventdata, handles)
% hObject    handle to Home_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(app)
portada


% --- Executes on selection change in Menu.
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hola 



% Hints: contents = cellstr(get(hObject,'String')) returns Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu


% --- Executes during object creation, after setting all properties.
function Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String')) 
pos = contents{get(hObject,'Value')} 

Func = get(handles.editTextFuncion,'String')
Func1 = replace(Func,'.^','^');
Func2 = replace(Func1,'.*','*');
Func3 = replace(Func2,'./','/');
syms t;
switch pos
    case 'Derivada'
        set(handles.LimInferior_1,'Visible','Off');
        set(handles.LimInferior_2,'Visible','Off');
        set(handles.LimSuperior_1,'Visible','Off');
        set(handles.LimSuperior_2,'Visible','Off');
        set(handles.BotonIntegrar_3,'Visible','Off');
        
        set(handles.GradoDerivada_1,'Visible','On');
        set(handles.GradoDerivada_2,'Visible','On');
        set(handles.BotonDerivar_3,'Visible','On');
        set(handles.Graficar_2,'Visible','On');
                   
    case 'Integral Indefinida'
        set(handles.LimInferior_1,'Visible','Off');
        set(handles.LimInferior_2,'Visible','Off');
        set(handles.LimSuperior_1,'Visible','Off');
        set(handles.LimSuperior_2,'Visible','Off');
        set(handles.BotonIntegrar_3,'Visible','Off');
        
        set(handles.GradoDerivada_1,'Visible','Off');
        set(handles.GradoDerivada_2,'Visible','Off');
        set(handles.BotonDerivar_3,'Visible','Off')
        set(handles.Graficar_2,'Visible','Off');
        
        B=get(handles.editTextFuncion,'String')
        Var=isempty(B)
        
        if Var==1
            set(handles.StaticTextCalculo,'String','Inserte Función');
        else
            iFunc =int(Func3,t);
            set(handles.StaticTextCalculo,'String',char(iFunc));
        end
       
    case 'Integral Definida'
        set(handles.LimInferior_1,'Visible','On');
        set(handles.LimInferior_2,'Visible','On');
        set(handles.LimSuperior_1,'Visible','On');
        set(handles.LimSuperior_2,'Visible','On');
        set(handles.BotonIntegrar_3,'Visible','On');
        
        set(handles.GradoDerivada_1,'Visible','Off');
        set(handles.GradoDerivada_2,'Visible','Off');
        set(handles.BotonDerivar_3,'Visible','Off')
        set(handles.Graficar_2,'Visible','Off');
        
       
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
