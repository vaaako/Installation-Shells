git clone git@github.com:feignbird/ChatterBot-spacy_fixed.git
pip3 install ./ChatterBot-spacy_fixed
pip3 uninstall pyYAML
pip3 install pyYAML==5.3.1
pip3 install chatterbot-corpus
pip3 install -U click
python3 -m spacy download en_core_web_sm

# Or just run pip3 install chatterbot==1.0.4
