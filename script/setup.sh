# Copyright (c) 2023 noOvertimeGroup
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

SOURCE_COMMIT=.github/pre-commit
TARGET_COMMIT=.git/hooks/pre-commit
SOURCE_PUSH=.github/pre-push
TARGET_PUSH=.git/hooks/pre-push
SOURCE_MSG_COMMIT=.github/commit-msg
TAGET_MSG_COMMIT=.git/hooks/commit-msg

# copy pre-commit file.
echo "设置 git pre-commit hooks..."
cp $SOURCE_COMMIT $TARGET_COMMIT

# copy pre-push file.
echo "设置 git pre-push hooks..."
cp $SOURCE_PUSH $TARGET_PUSH

# copy commit-msg file.
echo  "设置 git commit-msg hooks..."
cp $SOURCE_MSG_COMMIT $TAGET_MSG_COMMIT

# add permission to TARGET_PUSH and TARGET_COMMIT file.
test -x $TARGET_PUSH || chmod +x $TARGET_PUSH
test -x $TARGET_COMMIT || chmod +x $TARGET_COMMIT

echo "安装 golangci-lint..."
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.52.2

echo "安装 goimports..."
go install golang.org/x/tools/cmd/goimports@latest