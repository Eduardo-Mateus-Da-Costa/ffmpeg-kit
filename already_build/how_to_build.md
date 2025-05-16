# 📦 How to Build This Package (Android)

## 📌 Requisitos

### ✅ Sistema Operacional

* Um sistema **Linux** é necessário (preferencialmente Ubuntu 20.04+).

---

## 🧠 Passo 1 – Instale os Pacotes Necessários

Execute no terminal:

```bash
sudo apt update
sudo apt install -y \
  git build-essential clang cmake unzip yasm nasm pkg-config autoconf automake libtool m4 \
  zlib1g-dev libssl-dev libxml2-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libglib2.0-dev \
  libass-dev libtheora-dev libvorbis-dev libvpx-dev libwebp-dev libpng-dev libjpeg-dev \
  libuuid1 uuid-dev libexpat1-dev libfontconfig1-dev libmp3lame-dev libx264-dev libx265-dev \
  libopencore-amrnb-dev libopencore-amrwb-dev libopenjp2-7-dev libaom-dev libtwolame-dev \
  libsoxr-dev libzimg-dev libgmp-dev libsndfile1-dev libsamplerate0-dev libtesseract-dev \
  libleptonica-dev libxml2-utils openjdk-17-jdk python3 wget curl
```

---

## 📦 Passo 2 – Instale as Ferramentas Android

### Android Studio ou SDK CLI

Você deve instalar:

* **Android SDK**
* **Android NDK**
  ✅ Suportado: `NDK r23b` ou `r22b`
* Recomendado: Android API **22+**

---

## 📁 Passo 3 – Clone o Repositório

```bash
git clone https://github.com/seuusuario/ffmpeg-kit.git
cd ffmpeg-kit
```

⚠️ **Evite espaços ou caracteres especiais no caminho da pasta.**

---

## 🌎 Passo 4 – Configure as Variáveis de Ambiente

```bash
export ANDROID_NDK_ROOT=/caminho/para/android-ndk
export ANDROID_SDK_ROOT=/caminho/para/android-sdk
export PATH="$ANDROID_NDK_ROOT:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PATH"
```

---

## 💠 Passo 5 – Verifique as Opções de Build

```bash
./android.sh --help
```

---

## ✅ Passo 6 – Comando de Build Recomendado

```bash
./android.sh --full --enable-gpl --disable-lib-openssl --disable-lib-srt --disable-x86 --disable-arm-v7a --disable-arm-v7a-neon
```

---

## 🧐 Extras e Dicas

* `--lts`: força uso do FFmpeg 4.\*, útil para dispositivos mais antigos (mas pode ser incompatível com novos).
* `--enable-gpl`: permite uso de bibliotecas GPL como `libx264` e `libx265`.
* **⚠️ FFmpeg não pode usar **`openssl e gnutls`** ao mesmo tempo**.

    * Se desativar `openssl`, desative também `srt`.
    * Desativar `gnutls` pode causar um efeito cascata em libs como `tesseract`, `leptonica`, `libwebp`.

---

## 🚨 ATENÇÃO A TRAVAMENTOS!

Se a execução **ficar travada**, verifique o arquivo `build.log`. Caso veja mensagens como:

```
INFO: Skipping lame, dependencies built=0, already built=
INFO: Skipping libass, dependencies built=0, already built=
INFO: Skipping fontconfig, dependencies built=0, already built=
INFO: Skipping harfbuzz, dependencies built=0, already built=
INFO: Skipping libxml2, dependencies built=0, already built=
```

> 🔁 Isso indica dependências quebradas devido à desativação de bibliotecas.

✅ Solução:

* Interrompa a execução (`Ctrl+C` ou `kill`).
* Revise as opções usadas no script.
* Corrija as dependências faltantes ou extras.
* Execute o script novamente.

---

## 📄 Logs

Sempre verifique o arquivo `build.log` para entender falhas e warnings durante a compilação.

---

## 🛠️ Para limpar o ambiente

```bash
      rm -rf .tmp/ prebuilt/ build/ src/
      rm build.log
```