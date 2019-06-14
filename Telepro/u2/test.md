---
title: Easy Markdown to Beamer with Pandoc
subtitle: Simple things nobody tells you how to do
author: Justin Woo
date: 2018 onwards
theme: Madrid
colortheme: dolphin
fontfamily: noto-sans
header-includes:
- \usepackage{cmbright}
fontsize: 10pt
---

# Code demo

Here's some code:

``hs
data Maybe a = Just a | Nothing
``

Here's a centered image of a ratio of textwidth:

\begin{center}
  \includegraphics[width=0.4\textwidth]{./image.png}
\end{center}
