FROM debian:buster-slim

RUN apt-get update && apt-get -y install aspell-en

ENV PERSONAL_WORDS_LIST /allowed_words.pws

COPY allowed_words.pws "${PERSONAL_WORDS_LIST}"
COPY spell_check.sh spell_check.sh

CMD ["./spell_check.sh"]
