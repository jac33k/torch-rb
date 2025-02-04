module Torch
  module NN
    class Functional
      class << self
        def relu(input)
          Torch.relu(input)
        end

        def conv2d(input, weight, bias, stride: 1, padding: 0)
          # TODO pair stride and padding when needed
          Torch.conv2d(input, weight, bias, stride, padding)
        end

        def prelu(input, weight)
          Torch.prelu(input, weight)
        end

        def leaky_relu(input, negative_slope = 0.01)
          Torch.leaky_relu(input, negative_slope)
        end

        def max_pool2d(input, kernel_size)
          kernel_size = [kernel_size, kernel_size] if kernel_size.is_a?(Integer)
          Torch.max_pool2d(input, kernel_size)
        end

        def avg_pool2d(input, kernel_size)
          kernel_size = [kernel_size, kernel_size] if kernel_size.is_a?(Integer)
          Torch.avg_pool2d(input, kernel_size)
        end

        def linear(input, weight, bias)
          Torch.linear(input, weight, bias)
        end

        def mse_loss(input, target, reduction: "mean")
          Torch.mse_loss(input, target, reduction)
        end

        def cross_entropy(input, target)
          nll_loss(log_softmax(input, 1), target)
        end

        def nll_loss(input, target)
          # TODO fix for non-1d
          Torch.nll_loss(input, target)
        end

        def log_softmax(input, dim)
          input.log_softmax(dim)
        end

        def dropout(input, p: 0.5, training: true, inplace: false)
          if inplace
            Torch._dropout!(input, p, training)
          else
            Torch._dropout(input, p, training)
          end
        end

        def dropout2d(input, p: 0.5, training: true, inplace: false)
          if inplace
            Torch._feature_dropout!(input, p, training)
          else
            Torch._feature_dropout(input, p, training)
          end
        end

        def dropout3d(input, p: 0.5, training: true, inplace: false)
          if inplace
            Torch._feature_dropout!(input, p, training)
          else
            Torch._feature_dropout(input, p, training)
          end
        end

        def alpha_dropout(input, p: 0.5, training: true, inplace: false)
          if inplace
            Torch._alpha_dropout!(input, p, training)
          else
            Torch._alpha_dropout(input, p, training)
          end
        end

        def feature_alpha_dropout(input, p: 0.5, training: true, inplace: false)
          if inplace
            Torch._feature_alpha_dropout!(input, p, training)
          else
            Torch._feature_alpha_dropout(input, p, training)
          end
        end
      end
    end

    # shortcut
    F = Functional
  end
end
