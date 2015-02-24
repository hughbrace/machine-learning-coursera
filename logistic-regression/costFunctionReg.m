function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% J

sigma = 0;

for i = 1:m
    theta_x = theta' * X(i,:)';
    h_theta_x = sigmoid(theta_x);
    lhs = ((-y(i)) * (log(h_theta_x)));
    rhs = (1 - y(i)) * (log(1 - h_theta_x));
    sigma += (lhs - rhs);
endfor

J = ((1/m) * sigma) + ((lambda / (2 * m)) * sum(theta(2:end) .^ 2));
("J:"), disp(J);

% grad

for j = 1:length(theta);
    sigma = 0;
    for i = 1:m
        h_y = sigmoid(theta' * X(i,:)') - y(i);
        sigma += h_y * X(i,j);
    endfor
    grad(j) = (1 / m) * sigma;
    if (j > 1)
        grad(j) += ((lambda / m) * theta(j));
    endif

endfor

disp("grad:"), disp(grad);


% =============================================================

end
