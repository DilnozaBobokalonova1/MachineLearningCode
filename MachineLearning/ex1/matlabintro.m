%% Intro to matlab tutorial, Odelia Schwartz and Eero Simoncelli
%
% In Matlab's editor, to run one block of code (starting with %%)
% you can use the Run and Advance button.
% You can also copy and paste lines from a text editor into Matlab

% Intro to matlab tutorial.

%% (1) Help and basics
%%%%%%%%%%%%%%%%%%%%%%

% The symbol "%" is used in front of a comment.

% To get help type "help" (will give list of help topics) or "help topic"

% If you don't know the exact name of the topic or command you are looking for,
% type "lookfor keyword" (e.g., "lookfor regression")

% When writing a long matlab statement that exceeds a single row use ...
% to continue statement to next row.

% When using the command line, a ";" at the end means matlab will not
% display the result. If ";" is omitted then matlab will display result.

% Use the up-arrow to recall commands without retyping them (and down
% arrow to go forward in commands).

% Other commands borrowed from emacs and/or tcsh:
% C-a moves to beginning of line (C-e for end), C-f moves forward a
% character (C-b moves back), C-d deletes a character, C-k deletes 
% the line to the right of the cursor, C-p goes back through the
% command history and C-n goes forward (equivalent to up and down arrows).

%% (2) Objects in matlab -- the basic objects in matlab are scalars,
% vectors, and matrices...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define a scalar
N = 5

%% Define a row vector
v = [1 0 0]

%% Define a column vector
v = [1;2;3]
   
%% Transpose a vector (row to column or column to row)
v = v'

%% Define a vector in a certain range: v=start:stepsize:end
v = 1:.5:3

v = pi*[-4:4]/4

%% The empty vector
v = []

%% Define a matrix 
m = [1 2 3; 4 5 6]

%% matrices in matlab are such that 1ST parameter is ROWS
%                                  2ND parameter is COLS 
% Define a zeros/ones matrix/vector: zeros(numrows, numcols)
m = zeros(2,3)   

%%
v = ones(1,3)  

%% The identity matrix
m = eye(3)

%% Define a random matrix or vector: (see differences rand, randn)
v = rand(1,3) 
v = rand(1,3) 
v = rand(1,3) 

%% Note: if you don't define a variable, but just write down an expression
% matlab will by default assign it to variable ans.

[1 2 3]

%% Access a vector or matrix: vector(number) or matrix(rownumber, columnnumber)
v = [1 2 3];
v(3)

%%
m = [1 2 3; 4 5 6]
m(1,3)              %1st row, 3rd col

%% Access a row/column of a matrix: matrix(rownum,:) matrix(:,column)
% : means all values in that row or column, or you can specify a range of vals.

m
m(2,:)    %2nd row

%%
m
m(:,1)    %1st column

%%
m
m(2,1:2)

%%
m
m(1:2, 1:2)  %1st row to 2nd row, 1st col to 2nd col

%%
% size of a matrix

m
size(m)
size(m,1)  %num rows
size(m,2)  %num columns

%%
% we can create a new vector of zeros the same size as m
m1=zeros(size(m))

%%
% what objects/variables have I defined: who

%%
who

%%
% detailed description - whos

whos

%% (3) Simple operations on vectors and matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (A) Pointwise Operations:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addition of vectors/matrices and multiplication by a scalar
% are done "element by element"

a =[1 2 3 4];
2 * a 

%%
a = [1 2 3 4];
b = [5 6 7 8];
a + b

%%
% But * / ^ are matrix operations and do not operate "element by element". 
% To make them pointwise, use a "." in front: .* ./ .^

a = [1 2; 3 4]
point_sqrd = a .^2

%%
a = [1 2 3]';
b = [4 5 6]';
point_mult = a.*b

%%
% Matlab has a large number of built in functions, see p.7 matlab primer.
% some operate on each point of a vector/matrix:

log([1 2 3 4])

%%
round([1.5 2; 2.2 3.1])

%%
% (B) Vector Operations
%%%%%%%%%%%%%%%%%%%%%%%

% Built-in matlab functions that operate on a vector. If a matrix is given, 
% then operates on each column of matrix. Some examples:

%%
a=[1 4 6 3];
sum(a)

%%
a
mean(a)
std(a)
max(a)

%%
a = [1 2 3; 4 5 6]
mean(a)                      %mean of each column
max(a)                       %max of each column    
max( max([1 2 3; 4 5 6]) )   %to obtain max of matrix

%%
% (C) Matrix Operations:
%%%%%%%%%%%%%%%%%%%%%%%%

% matrix multiplication
% make sure sizes match- (i j) * (j k)

% [1 2 3]  * [4 5 6]  
% Here sizes do not match. We have a row vector 1x3 times a row
% vector 1x3.  Matlab will display the following error:
% ??? Error using ==> *
% Inner matrix dimensions must agree.

%%
[1 2 3] * [4 5 6]'  % row vector 1x3 times column vector 3x1 
                    % results in single number.
                    % also known as dot product or inner
                    % product of 2 vectors

%%
[1 2 3]' * [4 5 6]  % column vector size 3x1 times row vector 1x3
                    % results in 3x3 matrix.
                    % also known as outer product of 2 vectors.

%%
[4 5 6]' * [1 2 3]

%%
a=[1 2; 3 4]
b=[5 6; 7 8]
b*a
a*b                

%%
%(4) Saving your work
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% You can save all or some of the variables in your matlab
% session.

save mysession      %creates a file named session.mat with all vars

save mysession a b  %save only a and b
clear a b           %clear variables a and b

%% To load session

load mysession
a
b

%%(5) Relations and control statements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% relational operators: == (equal), ~= (not equal), <, <=, >, >=, etc.

% example: given a vector vec, create a new vector with values equal to 
% vec if they are > than 0, and equal to 0 if they <= 0.

vec=[3 5 -2 5 -1 0]

%%one method: loop through vec
new_vec = zeros(size(vec));        %initialize to zeros
for i = 1:size(vec,2)
   if vec(i)>0 new_vec(i) =vec(i); end
end
new_vec

%% But often loops can be avoided by using built in matlab functions
vec
new_vec2=zeros(size(vec));
tmp=find(vec>0)       %gives indices of all values of vector that are not 0
new_vec2(tmp)=vec(tmp)

%%(6) Plotting graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% one format: plot(Y, '<symbol or color>')

figure(1)
clf;
vec=[0 2 4 6 8];
plot(2*vec, 'o');                               

%% In red...
plot(2*vec, 'r o');

%% Or we can plot a line instead of using symbol 'o'...
plot(2*vec);

%% In the previous graphs the values for the X axis were not
% defined. So matlab chose its own default values for X
% (which were its indices going from 1 to 5)...
% The Y axis had the values 2*vec.
% We will replot this in the first part of the figure.

clf;
vec
subplot(1,2,1)
plot(2*vec, 'o');                 

%% In the second part of the figure we specify both the X and Y axes 
% of the graph. 
% The format now is: plot(X, Y, '<symbol or color>')
% Compare the X axes of the two graphs.
subplot(1,2,2);
plot(vec,2*vec, 'o');

%% We can also define limits of the axes.
subplot(1,2,1)
axis([0 8 0 16]);                        % [Xmin Xmax Ymin Ymax]
subplot(1,2,2)
axis([0 8 0 16]);                        % [Xmin Xmax Ymin Ymax]

%% plot sinusoid
clf;
x=pi*[-24:24]/24;
plot(x,sin(x));
xlabel('radians');
ylabel('sin value');
title('dummy');

%% several graphs in one plot:

figure(1)
clf
plot(x,sin(x));
hold on                    
plot(x,2.*cos(x),'r --');
legend('sin', 'cos');
hold off

%% using semilog
figure(1); clf;
x=-5:.25:5;
subplot(1,2,1)
plot(x,exp(x));
title('regular coordinates');
subplot(1,2,2)
semilogy(x,exp(x))
title('Y axis in log coordinates');

%% plot random matrice 
figure(2);
m=rand(8,5);
imagesc(m)
colormap('gray');
axis('square');

%% plot random matrice again
figure(2);
m=rand(8,5);
imagesc(m)
colormap('gray');
axis('square');

%% Saving a file as pdf
% Do a help on print for other options...
print -dpdf 'fig1' -f1;

%% The end. 