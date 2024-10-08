import { render, screen } from '@testing-library/react';
import Home from '../pages/index';  // Path to your homepage component

describe('Home page', () => {
    it('renders a heading', () => {
        render(<Home />);

        const heading = screen.getByRole('heading', {
            name: /welcome to next\.js!/i,
        });

        expect(heading).toBeInTheDocument();
    });
});