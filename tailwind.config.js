import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.vue',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
       
       colors: {
        primary: {
          DEFAULT: '#0D2F4E',
          light: '#254A6C',
          dark: '#061B31',
        },
        secondary: {
          DEFAULT: '#F5A623',
          light: '#FFC04D',
          dark: '#C27800',
        },
        neutral: {
          light: '#F9F9F9',
          gray: '#C4C4C4',
        }
      },
       },
    },

    plugins: [forms],
};
