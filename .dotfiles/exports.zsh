#########
# tools #
#########

# direnv
# make `direnv` silent
export DIRENV_LOG_FORMAT=

# eza completions
export FPATH="~/.misc/eza/completions/zsh:$FPATH"

# gst (for mopidy)
export GST_PLUGIN_PATH="$GST_PLUGIN_PATH:/usr/local/Cellar/gst-plugins-base:/usr/local/Cellar/gst-plugins-good:/usr/local/Cellar/gst-plugins-ugly"

# mcfly
export MCFLY_RESULTS=20
export MCFLY_FUZZY=2
export MCFLY_INTERFACE_VIEW=TOP
export MCFLY_PROMPT="❯"
eval "$(mcfly init zsh)"

# python
export PIP_REQUIRE_VIRTUALENV=true

# tldr
export TLRC_CONFIG=~/.config/tlrc/config.toml


############
# personal #
############

# travelers
export TRAVELERS_TRAVELERS="all"
export TRAVELERS_LOG_LEVEL=INFO
export TRAVELERS_ALL_PLAYING_SECS=60
export TRAVELERS_FADE_SECS=15
export TRAVELERS_FADE_LOWER_SECS=5
export TRAVELERS_FADE_UPPER_SECS=20
export TRAVELERS_SEGMENT_SECS=random
export TRAVELERS_SEGMENT_LOWER_SECS=15
export TRAVELERS_SEGMENT_UPPER_SECS=60
export TRAVELERS_RANDOMIZE_STAGGER_DIRECTION=false
export TRAVELERS_RANDOMIZE_STAGGER_NUM=true
export TRAVELERS_INTERLUDES_FREQ=random
export TRAVELERS_INTERLUDES_FREQ_LOWER_SEGMENTS=10
export TRAVELERS_INTERLUDES_FREQ_UPPER_SEGMENTS=20
export TRAVELERS_INTERLUDES_DIR=~/Music/lib/travelers/interludes

# kkjukebox
export KKJUKEBOX_FORCE_CUT=false
export KKJUKEBOX_LOG_LEVEL=INFO
export KKJUKEBOX_MUSIC_DIR=~/Music/lib/kkjukebox

export KKJUKEBOX_HOURLY_GAME=random
export KKJUKEBOX_HOURLY_HOUR=now
export KKJUKEBOX_HOURLY_WEATHER=location
export KKJUKEBOX_HOURLY_LOCATION=local
export KKJUKEBOX_HOURLY_LOOP_LENGTH=random
export KKJUKEBOX_HOURLY_LL_UPPER=600
export KKJUKEBOX_HOURLY_LL_LOWER=300

export KKJUKEBOX_KK_VERSIONS="aircheck musicbox"
export KKJUKEBOX_KK_LOOP_LENGTH=random
export KKJUKEBOX_KK_LL_UPPER=120
export KKJUKEBOX_KK_LL_LOWER=60

# biteme
export BITEME_PLAY=true
export BITEME_MEDIA_PLAYER="iina"
