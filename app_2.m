function varargout = app_2(varargin)
% APP_2 MATLAB code for app_2.fig
%      APP_2, by itself, creates a new APP_2 or raises the existing
%      singleton*.
%
%      H = APP_2 returns the handle to a new APP_2 or the handle to
%      the existing singleton*.
%
%      APP_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_2.M with the given input arguments.
%
%      APP_2('Property','Value',...) creates a new APP_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_2

% Last Modified by GUIDE v2.5 02-Jul-2020 22:41:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_2_OpeningFcn, ...
                   'gui_OutputFcn',  @app_2_OutputFcn, ...
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


% --- Executes just before app_2 is made visible.
function app_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_2 (see VARARGIN)


% Choose default command line output for app_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Sumar.
function Sumar_Callback(hObject, eventdata, handles)
% hObject    handle to Sumar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Restar 
Datos_A= get(handles.Tabla_A,'data');
Datos_A1=str2double(Datos_A);

Datos_B= get(handles.Tabla_B,'data');
Datos_B1=str2double(Datos_B);



if  all(cellfun(@isempty,Datos_B(:))) && all(cellfun(@isempty,Datos_A(:)))
    set(handles.Mostrar2,'String','Ingrese Matriz A y B');
elseif all(cellfun(@isempty,Datos_B(:)))
    set(handles.Mostrar2,'String','Ingrese Matriz B');
elseif all(cellfun(@isempty,Datos_A(:)))
     set(handles.Mostrar2,'String','Ingrese Matriz A');
else
    Restar= Datos_A1-Datos_B1;
    Restar1=round(Restar);
    set(handles.Mostrar2,'String',num2str(Restar1));
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datos_A= get(handles.Tabla_A,'data');
Datos_A1=str2double(Datos_A);

Datos_B= get(handles.Tabla_B,'data');
Datos_B1=str2double(Datos_B);

C1=str2double(get(handles.Num_Columnas_A,'String'));
F2=str2double(get(handles.Num_Filas_B,'String'));

A=all(cellfun(@isempty,Datos_A(:)));
B= all(cellfun(@isempty,Datos_B(:)));
 if A && B == 1
     set(handles.Mostrar2,'String','Ingrese Matriz A y B');
 elseif A==1
     set(handles.Mostrar2,'String','Ingrese Matriz A');
 elseif B==1
     set(handles.Mostrar2,'String','Ingrese Matriz B');
 else
    if C1==F2
        Multi=Datos_A1.*Datos_B1;
        Multi1=round(Multi);
        set(handles.Mostrar2,'String',num2str(Multi1));
    else
        set(handles.Mostrar2,'String',' No se puede multiplicar revisar dimensiones de Matriz A y B');
     end
 end





% --- Executes on button press in Ingresar_A.
function Ingresar_A_Callback(hObject, eventdata, handles)
% hObject    handle to Ingresar_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Ingresar Datos de Tabla A
filas=str2double(get(handles.Num_Filas_A,'String'));
columnas=str2double(get(handles.Num_Columnas_A,'String'));
tamano=cell(filas,columnas);
tamano(:,:)={''};
set(handles.Tabla_A,'Data',tamano);
set(handles.Tabla_A,'ColumnEditable',true(1,columnas));



% --- Executes on button press in Ingreso_B.
function Ingreso_B_Callback(hObject, eventdata, handles)
% hObject    handle to Ingreso_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Ingresar Datos de Tabla B
filasB=str2double(get(handles.Num_Filas_B,'String'));
columnas=str2double(get(handles.Num_Columnas_B,'String'));
tamano=cell(filasB,columnas);
tamano(:,:)={''};
set(handles.Tabla_B,'Data',tamano);
set(handles.Tabla_B,'ColumnEditable',true(1,columnas));


% --- Executes on button press in analisis_matematico.
function analisis_matematico_Callback(hObject, eventdata, handles)
% hObject    handle to analisis_matematico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(app_2)
app


% --- Executes on button press in InversaA.
function InversaA_Callback(hObject, eventdata, handles)
% hObject    handle to InversaA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filas=str2double(get(handles.Num_Filas_A,'String'));
columnas=str2double(get(handles.Num_Columnas_A,'String'));

Datos_A= get(handles.Tabla_A,'data');
Datos_A1=str2double(Datos_A);


A=all(cellfun(@isempty,Datos_A(:)))

 if A == 1
     set(handles.Mostrar2,'String','Ingrese Matriz A');
 else
    if filas == columnas
            determinante=det(Datos_A1);
            h=round(determinante);
            
            if h ~= 0
                inversa=(inv(Datos_A1));    
                set(handles.Mostrar2,'string',num2str(inversa));
            else
            set(handles.Mostrar2,'string','No es posible calcular la inversa, el determinante es 0');
            end
            
    else
      
      set(handles.Mostrar2,'string','La matriz debe ser cuadrada');
    
    end
 end
     
 







% --- Executes on button press in InversaB.
function InversaB_Callback(hObject, eventdata, handles)
% hObject    handle to InversaB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filas=str2double(get(handles.Num_Filas_B,'String'));
columnas=str2double(get(handles.Num_Columnas_B,'String'));

Datos_B= get(handles.Tabla_B,'data');
Datos_B1=str2double(Datos_B);


B=all(cellfun(@isempty,Datos_B(:)))

 if B == 1
     set(handles.Mostrar2,'String','Ingrese Matriz B');
 else
    if filas == columnas
            determinante=det(Datos_B1);
            h=round(determinante);
            
            if h ~= 0
                inversa=(inv(Datos_B1));    
                set(handles.Mostrar2,'string',num2str(inversa));
            else
            set(handles.Mostrar2,'string','No es posible calcular la inversa, el determinante es 0');
            end
            
    else
      
      set(handles.Mostrar2,'string','La matriz debe ser cuadrada');
    
    end
 end
 



function Num_Filas_A_Callback(hObject, eventdata, handles)
% hObject    handle to Num_Filas_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num_Filas_A as text
%        str2double(get(hObject,'String')) returns contents of Num_Filas_A as a double


% --- Executes during object creation, after setting all properties.
function Num_Filas_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Filas_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Num_Columnas_A_Callback(hObject, eventdata, handles)
% hObject    handle to Num_Columnas_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num_Columnas_A as text
%        str2double(get(hObject,'String')) returns contents of Num_Columnas_A as a double


% --- Executes during object creation, after setting all properties.
function Num_Columnas_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Columnas_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Num_Filas_B_Callback(hObject, eventdata, handles)
% hObject    handle to Num_Filas_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num_Filas_B as text
%        str2double(get(hObject,'String')) returns contents of Num_Filas_B as a double


% --- Executes during object creation, after setting all properties.
function Num_Filas_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Filas_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Num_Columnas_B_Callback(hObject, eventdata, handles)
% hObject    handle to Num_Columnas_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num_Columnas_B as text
%        str2double(get(hObject,'String')) returns contents of Num_Columnas_B as a double


% --- Executes during object creation, after setting all properties.
function Num_Columnas_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Columnas_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Mostrar1_Callback(hObject, eventdata, handles)
% hObject    handle to Mostrar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mostrar1 as text
%        str2double(get(hObject,'String')) returns contents of Mostrar1 as a double


% --- Executes during object creation, after setting all properties.
function Mostrar1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mostrar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sumatoria.
function Sumatoria_Callback(hObject, eventdata, handles)
% hObject    handle to Sumatoria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datos_A= get(handles.Tabla_A,'data');
Datos_A1=str2double(Datos_A);


Datos_B= get(handles.Tabla_B,'data');
Datos_B1=str2double(Datos_B);


if all(cellfun(@isempty,Datos_A(:))) && all(cellfun(@isempty,Datos_B(:)))
    set(handles.Mostrar2,'String','Ingrese Matriz A y B');
elseif all(cellfun(@isempty,Datos_A(:)))
    set(handles.Mostrar2,'String','Ingrese Matriz A');
elseif all(cellfun(@isempty,Datos_B(:)))
    set(handles.Mostrar2,'String','Ingrese Matriz B');
else
    Sumar= Datos_A1+Datos_B1;
    Sumar1=round(Sumar);
    set(handles.Mostrar2,'String',num2str(Sumar1));
end










% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Mostrar2,'String','');
set(handles.Tabla_A,'Data',{});
set(handles.Tabla_B,'Data',{});


% --- Executes on button press in Ingresar_MatrizA.
function Ingresar_MatrizA_Callback(hObject, eventdata, handles)
% hObject    handle to Ingresar_MatrizA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filas=str2double(get(handles.Num_Filas_A,'String'));
columnas=str2double(get(handles.Num_Columnas_A,'String'));
tamano=cell(filas,columnas);
tamano(:,:)={''};
set(handles.Tabla_A,'Data',tamano);
set(handles.Tabla_A,'ColumnEditable',true(1,columnas));



% --- Executes when entered data in editable cell(s) in Tabla_A.
function Tabla_A_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Tabla_A (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Home.
function Home_Callback(hObject, eventdata, handles)
% hObject    handle to Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(app_2)
portada
