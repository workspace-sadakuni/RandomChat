class HomeController < ApplicationController
  def index
    @quotes = ["あなたの心が正しいと思うことをしなさい。どっちにしたって批判されるのだから。","前進しない人は、後退しているのだ。","最も重要な決定とは、何をするかではなく、何をしないかを決めることだ。","自分で自分をあきらめなければ、人生に「負け」はない。","人生は公平ではない。そのことに慣れよう。","雲の向こうは、いつも青空"]
  end

  def login
  end
end
