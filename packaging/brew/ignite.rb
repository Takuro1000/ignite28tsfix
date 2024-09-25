class Ignite < Formula
  desc "Build, launch, and maintain any crypto application with Ignite CLI"
  homepage "https://github.com/Takuro1000/homebrew-ignite28tsfix"  # フォークしたリポジトリのURLに変更
  url "https://github.com/Takuro1000/homebrew-ignite28tsfix/archive/refs/tags/v28.5.3ts.tar.gz"  # 適切なURLを指定
  sha256 "5a6c482fa10894b9bfef54273a589de0c27cf2145dc168b60783b35c2444fe99"  # 正しいSHA256ハッシュを使用

  license "Apache-2.0"

  depends_on "go"
  depends_on "node"

  def install
    # Goのビルドコマンドを修正
    system "go", "build", "-mod=readonly", *std_go_args(output: bin/"ignite"), "./ignite/cmd/ignite"
  end

  test do
    ENV["DO_NOT_TRACK"] = "1"
    # テストの内容を変更（必要に応じて）
    system bin/"ignite", "s", "chain", "mars"
    assert_predicate testpath/"mars/go.mod", :exist?
  end
end
