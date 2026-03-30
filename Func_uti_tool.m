clc
clear

var_name  = input("What are your variables (comma-separated)? e.g x,y,z: ", 's');
vars_fixed = strtrim(split(var_name, ","));
vars_sym = sym(vars_fixed);
syms k n
moveing_var = input("Which dependent variable? ", "s");
var_sym = str2sym(moveing_var);

function_made = input("Write your function: ", "s");
f = str2sym(function_made);

disp("You said: " + string(f));

questioning = 1;

while questioning == 1
    choice = input("Type 1 (diff), 2 (int), 3 (find zero), 4 (imput value), 5(exit): ");

    switch(choice)
        case 1
                d = diff(f, var_sym);
            disp("Derivative: " + string(d))

        case 2
            d = int(f, var_sym);
            disp("Integral: " + string(d))
        case 3
            [sol, params, conds] = solve(f == 0, var_sym, 'ReturnConditions', true);
            disp("x =  " + string(sol))
        case 4
        test_val = input("what number would you like to see? ", 's');
        test_val_sym = str2sym(test_val);
        d = subs(f, var_sym, test_val_sym);
        disp("f(" + test_val + ") = " + string(d))
        case 5
            questioning = 0;
        otherwise
            disp("Invalid choice.")
    end
    if(choice == 1 || choice == 2)
    rename = input("would you to rename your function to this output? 1 for yes 0 for no: ");
    if(rename)
        f = d;
    end
disp(latex(d));
    end
end
